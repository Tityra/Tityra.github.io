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
import pathlib
import re
import sys
import urllib.request

path = pathlib.Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
problems = []

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

# --- every link resolves, and points where the text says ---------------------
inline = set(re.findall(r"\]\((https?://[^)\s]+)\)", body))
for url in sorted(set(figure_urls) | inline):
    clean = url.strip().strip("'\"")
    try:
        request = urllib.request.Request(clean, headers={"User-Agent": "Mozilla/5.0"})
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

if problems:
    print(f"NOT FIT TO PUBLISH — {path}")
    for problem in problems:
        print(f"  · {problem}")
    sys.exit(1)

print(f"{path}: ok — {len(source_urls)} sources, {len(inline)} inline links, all resolve")
PY
