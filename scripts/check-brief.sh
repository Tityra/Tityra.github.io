#!/usr/bin/env bash
# Validate a brief before it is published.
#
#   ./scripts/check-brief.sh _posts/2026-09-30-ai-daily-brief.md
#
# Exits non-zero if the brief is not fit to publish. This exists because the
# daily job commits and pushes on its own: "publish automatically" must not mean
# "publish anything". Nobody reads these before they go out, so the checks a
# human would have done have to run here.
set -euo pipefail
cd "$(dirname "$0")/.."

FILE="${1:-}"
if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "usage: $0 _posts/YYYY-MM-DD-slug.md" >&2
  exit 2
fi

exec python3 - "$FILE" <<'PY'
import datetime
import pathlib
import re
import sys
import urllib.request

path = pathlib.Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
problems = []


def anchored_urls(document):
    """Every URL the document stands on: the inline links in its body and the
    `url:` lines in its front matter."""
    return set(re.findall(r"\]\((https?://[^)\s]+)\)", document)) | {
        found.strip().strip("'\"")
        for found in re.findall(r"^\s*url:\s*(\S+)", document, re.M)
    }


def stamp(document):
    found = re.search(r"^date:\s*(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d)", document, re.M)
    if not found:
        return None
    try:
        return datetime.datetime.strptime(found.group(1), "%Y-%m-%d %H:%M:%S")
    except ValueError:
        return None

parts = text.split("---", 2)
if len(parts) < 3:
    print(f"{path}: no front matter", file=sys.stderr)
    sys.exit(1)
front, body = parts[1], parts[2]

# --- the fields a published brief must carry --------------------------------
for key in ("title:", "date:", "summary:", "sources:"):
    if key not in front:
        problems.append(f"front matter is missing `{key}`")

# --- nothing half-written ---------------------------------------------------
for number, line in enumerate(text.splitlines(), 1):
    if "TODO" in line:
        problems.append(f"line {number} still says TODO: {line.strip()[:70]}")

if not body.strip():
    problems.append("the body is empty")

# --- every claim has somewhere to go ----------------------------------------
# Only the urls under `sources:`, not the ones attached to figures.
sources_section = front.split("sources:", 1)[1] if "sources:" in front else ""
source_urls = re.findall(r"^\s*url:\s*(\S+)", sources_section, re.M)
figure_urls = re.findall(r"^\s*url:\s*(\S+)", front, re.M)
if not source_urls:
    problems.append("`sources` is empty — a brief with no sources cannot be published")

# --- figures, if present, are complete and attributed -----------------------
figures_block = re.search(r"^figures:\n((?:\s+[-#].*\n|\s+\w+:.*\n)+)", front, re.M)
if figures_block:
    entries = re.findall(r"-\s+value:", figures_block.group(1))
    for field in ("label:", "url:"):
        if figures_block.group(1).count(field) < len(entries):
            problems.append(f"a figure is missing `{field}` — every figure names whose number it is and links it")
    if len(entries) > 3:
        problems.append(f"{len(entries)} figures; the maximum is three")

# --- not published into the future ------------------------------------------
# Jekyll silently drops a future-dated post. The push succeeds, the Pages build
# goes green, and the brief is simply not on the site — the worst shape this
# failure can take, because every signal says it worked. Twice now.
published = stamp(text)
if published is None:
    problems.append("`date:` is missing or not `YYYY-MM-DD HH:MM:SS`")
else:
    now = datetime.datetime.now()
    if published > now:
        problems.append(
            f"dated {published:%Y-%m-%d %H:%M} but it is now {now:%Y-%m-%d %H:%M} — "
            "Jekyll leaves a future-dated post out of the build, so this would "
            "push and build green and still not appear"
        )

# --- every link resolves, and points where the text says ---------------------
inline = set(re.findall(r"\]\((https?://[^)\s]+)\)", body))
for url in sorted(set(figure_urls) | inline):
    clean = url.strip().strip("'\"")
    try:
        # A bare "Mozilla/5.0" is bot-blocked by several publishers — openai.com
        # answers it with 403 while serving the same page 200 to a browser. That
        # is a false negative, and it already cost a brief a source it had read.
        # The check is still "HTTP 200 or it does not publish"; only the request
        # looks like a reader now.
        request = urllib.request.Request(
            clean,
            headers={
                "User-Agent": (
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36"
                ),
                "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                "Accept-Language": "en-US,en;q=0.9",
            },
        )
        status = urllib.request.urlopen(request, timeout=25).status
    except Exception as error:  # noqa: BLE001 - any failure is a failure to publish
        status = getattr(error, "code", type(error).__name__)
    if status != 200:
        problems.append(f"link does not resolve ({status}): {clean}")

# --- no story told twice ------------------------------------------------------
# TOP 3 is an index and may point at items expanded below. Any other section
# carrying the same source means the same story is being told twice.
sections = {}
chunks = re.split(r"^## (.+)$", body, flags=re.M)
for index in range(1, len(chunks), 2):
    sections[chunks[index].strip()] = chunks[index + 1]

homes = {}
for name, content in sections.items():
    if name.strip().upper().startswith("TOP"):
        continue
    for url in set(re.findall(r"\]\((https?://[^)\s]+)\)", content)):
        homes.setdefault(url, []).append(name)

for url, names in sorted(homes.items()):
    if len(names) > 1:
        problems.append(
            f"the same source anchors items in {len(names)} sections "
            f"({', '.join(names)}) — one story, one home: {url}"
        )

# --- an edition says something the day has not said yet ------------------------
# More than one brief a day is allowed when a reader asks for another. What is
# not allowed is the same story twice: a later edition that re-anchors a source
# an earlier one already used is reprinting, not reporting.
day = re.match(r"(\d{4}-\d\d-\d\d)-ai-daily-brief", path.name)
mine = stamp(text)
if day and mine:
    for sibling in sorted(path.parent.glob(f"{day.group(1)}-ai-daily-brief*.md")):
        if sibling.resolve() == path.resolve():
            continue
        other = sibling.read_text(encoding="utf-8")
        when = stamp(other)
        if when is None or when >= mine:
            continue  # only what was published before this one can be repeated
        for url in sorted(anchored_urls(text) & anchored_urls(other)):
            problems.append(
                f"{sibling.name} already covered this source earlier today — "
                f"an edition carries what is new since it: {url}"
            )

if problems:
    print(f"NOT FIT TO PUBLISH — {path}")
    for problem in problems:
        print(f"  · {problem}")
    sys.exit(1)

print(f"{path}: ok — {len(source_urls)} sources, {len(inline)} inline links, all resolve")
PY
