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
import pathlib
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from datetime import datetime, timedelta, timezone
from email.utils import parsedate_to_datetime

FEEDS = [
    # Primary vendor and lab announcements. The brief leads with launches, so
    # this half of the list decides what the day's top story can be. It was
    # five entries long, and one of them (Cloudflare) publishes about ten
    # items a day while the others publish one; three briefs in a row then
    # led with Cloudflare because the candidate list had nothing else to lead
    # with. Breadth here is the fix, not a rule in the guidelines.
    ("Google AI", "https://blog.google/technology/ai/rss/"),
    ("Google DeepMind", "https://deepmind.google/blog/rss.xml"),
    ("OpenAI", "https://openai.com/news/rss.xml"),
    ("Mistral", "https://mistral.ai/rss.xml"),
    ("Qwen", "https://qwenlm.github.io/blog/index.xml"),
    ("NVIDIA", "https://blogs.nvidia.com/feed/"),
    ("Microsoft Azure", "https://azure.microsoft.com/en-us/blog/feed/"),
    ("AWS Machine Learning", "https://aws.amazon.com/blogs/machine-learning/feed/"),
    ("Meta Engineering", "https://engineering.fb.com/feed/"),
    ("Cloudflare", "https://blog.cloudflare.com/rss/"),
    ("Hugging Face", "https://huggingface.co/blog/feed.xml"),
    ("GitHub", "https://github.blog/feed/"),
    ("PyTorch", "https://pytorch.org/blog/feed.xml"),
    ("Together AI", "https://www.together.ai/blog/rss.xml"),
    ("Ollama", "https://ollama.com/blog/rss.xml"),
    ("Replicate", "https://replicate.com/blog/rss"),
    # Anthropic publishes no public feed; its announcements reach this list
    # only when another source carries them, and that is worth knowing.
    #
    # Papers, coverage and chatter. These never supply a launch, so they are
    # held to a tighter cap than the announcement feeds above.
    ("arXiv cs.AI", "http://export.arxiv.org/rss/cs.AI"),
    ("arXiv cs.LG", "http://export.arxiv.org/rss/cs.LG"),
    ("arXiv cs.CL", "http://export.arxiv.org/rss/cs.CL"),
    ("MIT Technology Review", "https://www.technologyreview.com/topic/artificial-intelligence/feed"),
    ("The Verge AI", "https://www.theverge.com/rss/ai-artificial-intelligence/index.xml"),
    ("Simon Willison", "https://simonwillison.net/atom/everything/"),
    ("Hacker News", "https://hnrss.org/frontpage?points=150"),
    ("r/LocalLLaMA", "https://www.reddit.com/r/LocalLLaMA/.rss"),
    ("r/MachineLearning", "https://www.reddit.com/r/MachineLearning/.rss"),
]

# A loud blog must not be able to crowd out a quiet one just by posting more.
PER_SOURCE = 6

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


def recent_coverage(limit: int = 3) -> list[tuple[str, list[str]]]:
    """What the last few briefs already carried, read from the posts themselves.

    The agent cannot remember yesterday, so without this it re-reads the same
    loud feed and leads with the same vendor again. Three briefs in a row led
    with Cloudflare that way.
    """
    posts = sorted(pathlib.Path("_posts").glob("*-ai-daily-brief*.md"), reverse=True)
    covered: list[tuple[str, list[str]]] = []
    for post in posts[:limit]:
        try:
            text = post.read_text(encoding="utf-8")
        except OSError:
            continue
        front = text.split("---", 2)[1] if text.startswith("---") else ""
        urls = re.findall(r"^\s*url:\s*(\S+)", front, re.M)
        covered.append((post.name, [u.strip().strip("'\"") for u in urls]))
    return covered


def host(url: str) -> str:
    return urllib.parse.urlsplit(url).netloc.removeprefix("www.")


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
    tally: list[tuple[str, int]] = []
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
        shown = recent[:PER_SOURCE]
        print(f"## {name}")
        for when, title, link in shown:
            print(f"  - [{when.astimezone(timezone.utc):%Y-%m-%d %H:%MZ}] {title}")
            print(f"    {link}")
            total += 1
        if len(recent) > len(shown):
            print(f"  ({len(recent) - len(shown)} more from this source not shown)")
        print()
        tally.append((name, len(shown)))

    print(f"TOTAL: {total} item(s) in the window, at most {PER_SOURCE} per source.")
    if tally:
        print("BY SOURCE: " + ", ".join(f"{name} {count}" for name, count in sorted(tally, key=lambda row: -row[1])))
        loudest, count = max(tally, key=lambda row: row[1])
        if total and count / total > 0.3:
            print(
                f"SKEW: {loudest} supplied {count} of {total} items. A source that posts "
                "more often is not thereby more important — do not let it take the lead "
                "slot by volume alone."
            )
    if unreachable:
        print(f"UNREACHABLE: {', '.join(unreachable)} — coverage is incomplete, say so in the report.")

    covered = recent_coverage()
    if covered:
        print()
        print("ALREADY COVERED — the last briefs this blog published:")
        for name, urls in covered:
            hosts = sorted({host(u) for u in urls if u.startswith("http")})
            print(f"  {name}: {', '.join(hosts) or 'no sources listed'}")
            for u in urls:
                print(f"    {u}")
        print("  A story this blog has already carried is not news again. If the same")
        print("  outlet led the previous brief, it does not lead this one unless the new")
        print("  story is plainly bigger than everything else on offer — and say why.")

    if total == 0:
        print("No items. That is a real answer: publish nothing rather than inventing a brief.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
