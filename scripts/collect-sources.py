#!/usr/bin/env python3
"""Collect candidate items for the daily brief from public feeds.

Plain HTTP against published RSS/Atom feeds, using only the standard library.
No API key, no search backend, no tool gateway, no login. That is the point:
the brief's research step must not depend on a credential that can lapse or a
service that can be unentitled overnight, both of which have already stopped
this job once.

Output is plain text on stdout, grouped by source, which Hermes injects into the
agent's prompt. Every line carries a real URL, so the agent is choosing among
things that exist rather than recalling things it believes.

    python3 collect-sources.py [--hours 24]
"""
from __future__ import annotations

import argparse
import re
import sys
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
from datetime import datetime, timedelta, timezone
from email.utils import parsedate_to_datetime

FEEDS = [
    ("Google AI", "https://blog.google/technology/ai/rss/"),
    ("OpenAI", "https://openai.com/news/rss.xml"),
    ("Cloudflare", "https://blog.cloudflare.com/rss/"),
    ("Hugging Face", "https://huggingface.co/blog/feed.xml"),
    ("GitHub", "https://github.blog/feed/"),
    ("arXiv cs.AI", "http://export.arxiv.org/rss/cs.AI"),
    ("arXiv cs.LG", "http://export.arxiv.org/rss/cs.LG"),
    ("Hacker News", "https://hnrss.org/frontpage?points=150"),
    ("r/LocalLLaMA", "https://www.reddit.com/r/LocalLLaMA/.rss"),
    ("r/MachineLearning", "https://www.reddit.com/r/MachineLearning/.rss"),
]

# Reddit rejects a bare bot string; this one is accepted and still identifies us.
AGENT = "Mozilla/5.0 (Tityra news reader; +https://tityra.github.io/)"
NS = {"atom": "http://www.w3.org/2005/Atom", "dc": "http://purl.org/dc/elements/1.1/"}


def fetch(url: str, timeout: int = 25) -> bytes | None:
    request = urllib.request.Request(url, headers={"User-Agent": AGENT})
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            return response.read()
    except (urllib.error.URLError, urllib.error.HTTPError, OSError):
        return None


def parse_date(text: str | None) -> datetime | None:
    if not text:
        return None
    text = text.strip()
    try:  # RFC 822, as used by RSS
        return parsedate_to_datetime(text)
    except (TypeError, ValueError, IndexError):
        pass
    cleaned = re.sub(r"Z$", "+00:00", text)
    try:  # ISO 8601, as used by Atom
        return datetime.fromisoformat(cleaned)
    except ValueError:
        return None


def entries(raw: bytes) -> list[tuple[str, str, datetime | None]]:
    try:
        root = ET.fromstring(raw)
    except ET.ParseError:
        return []
    found: list[tuple[str, str, datetime | None]] = []

    for item in root.iter():
        tag = item.tag.split("}")[-1]
        if tag not in ("item", "entry"):
            continue
        title = link = date_text = None
        for child in item:
            name = child.tag.split("}")[-1]
            if name == "title" and child.text:
                title = " ".join(child.text.split())
            elif name == "link":
                link = child.get("href") or (child.text or "").strip()
            elif name in ("pubDate", "published", "updated", "date"):
                date_text = date_text or child.text
        if title and link:
            found.append((title, link, parse_date(date_text)))
    return found


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--hours", type=int, default=24)
    args = parser.parse_args()

    cutoff = datetime.now(timezone.utc) - timedelta(hours=args.hours)
    now = datetime.now(timezone.utc)

    print(f"CANDIDATE ITEMS — public feeds, last {args.hours}h")
    print(f"Collected {now.isoformat(timespec='seconds')} · no API key, no search backend")
    print("Every line below is a real published item. Verify each one you use by")
    print("opening its URL; these titles are feed metadata, not confirmed facts.")
    print()

    total = 0
    unreachable: list[str] = []
    for name, url in FEEDS:
        raw = fetch(url)
        if raw is None:
            unreachable.append(name)
            continue
        recent = []
        for title, link, when in entries(raw):
            if when is None:
                continue
            if when.tzinfo is None:
                when = when.replace(tzinfo=timezone.utc)
            if when >= cutoff:
                recent.append((when, title, link))
        if not recent:
            continue
        recent.sort(reverse=True)
        print(f"## {name}")
        for when, title, link in recent[:12]:
            print(f"  - [{when.astimezone(timezone.utc):%Y-%m-%d %H:%MZ}] {title}")
            print(f"    {link}")
            total += 1
        print()

    print(f"TOTAL: {total} item(s) in the window.")
    if unreachable:
        print(f"UNREACHABLE: {', '.join(unreachable)} — coverage is incomplete, say so in the report.")
    if total == 0:
        print("No items. That is a real answer: publish nothing rather than inventing a brief.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
