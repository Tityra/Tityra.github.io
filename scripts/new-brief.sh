#!/usr/bin/env bash
# Create the skeleton for a daily brief.
#
#   ./scripts/new-brief.sh                # today, Asia/Seoul
#   ./scripts/new-brief.sh 2026-10-01     # a specific date
#   ./scripts/new-brief.sh --edition      # a second (third, ...) brief for today
#
# Without --edition, exits 3 if a brief already exists for that date. A daily
# cron can run twice - a retry, a clock crossing midnight - and an unasked-for
# second run must not produce two posts for one day or overwrite the first.
#
# --edition is the deliberate exception: a run the reader asked for by hand, to
# publish again on a day that already has a brief. It never touches the earlier
# one; it writes the next free `-2`, `-3`, ... file and stamps a later time so
# the day reads in publication order.
set -euo pipefail
cd "$(dirname "$0")/.."

DATE=""
EDITION=0
for arg in "$@"; do
  case "$arg" in
    --edition) EDITION=1 ;;
    -*) echo "usage: $0 [YYYY-MM-DD] [--edition]" >&2; exit 2 ;;
    *) DATE="$arg" ;;
  esac
done
DATE="${DATE:-$(TZ=Asia/Seoul date +%F)}"
if ! [[ "$DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "usage: $0 [YYYY-MM-DD] [--edition]" >&2
  exit 2
fi

# Only a *brief* for this date blocks a new one. Matching any post for the date
# was wrong: the agent's route around it was to delete the other post, which is
# how the launch note was lost on 2026-09-30.
existing=$(find _posts -maxdepth 1 -name "${DATE}-ai-daily-brief.md" -print -quit 2>/dev/null || true)
if [ -n "$existing" ] && [ "$EDITION" -eq 0 ]; then
  echo "A brief already exists for ${DATE}: ${existing}" >&2
  echo "Edit that file, or pass --edition to publish again today." >&2
  echo "Never delete or overwrite another post to make room." >&2
  exit 3
fi

FILE="_posts/${DATE}-ai-daily-brief.md"
# Now, never a fixed hour. This read `09:00:00` while the schedule fires at
# 06:00, so Jekyll saw a post three hours in the future and left it out of the
# build that the very same push triggered: a green build, a pushed commit and
# nothing on the site.
STAMP="$(TZ=Asia/Seoul date '+%Y-%m-%d %H:%M:%S %z')"
ORDINAL=""

if [ "$EDITION" -eq 1 ]; then
  if [ -z "$existing" ]; then
    # Nothing to follow: --edition on a day with no brief is just the first one.
    EDITION=0
  else
    n=2
    while [ -e "_posts/${DATE}-ai-daily-brief-${n}.md" ]; do n=$((n + 1)); done
    FILE="_posts/${DATE}-ai-daily-brief-${n}.md"
    case "$n" in
      2) ORDINAL="second" ;; 3) ORDINAL="third" ;; 4) ORDINAL="fourth" ;;
      5) ORDINAL="fifth" ;;  *) ORDINAL="${n}th" ;;
    esac
    # Sort after every brief already published today, whatever the hour: Jekyll
    # orders same-day posts by this stamp, and an edition written at 00:46 must
    # still read as the later one next to a 09:00 brief.
    STAMP=$(TZ=Asia/Seoul python3 - "$DATE" <<'STAMPER'
import datetime, pathlib, re, sys

date = sys.argv[1]
latest = datetime.datetime.strptime(f"{date} 00:00:00", "%Y-%m-%d %H:%M:%S")
for post in pathlib.Path("_posts").glob(f"{date}-*.md"):
    found = re.search(r"^date:\s*(\S+ \S+)", post.read_text(encoding="utf-8"), re.M)
    if not found:
        continue
    try:
        when = datetime.datetime.strptime(found.group(1), "%Y-%m-%d %H:%M:%S")
    except ValueError:
        continue
    latest = max(latest, when)
now = datetime.datetime.now()
stamp = max(now, latest + datetime.timedelta(minutes=1))
if stamp.date() != now.date():  # an edition never spills into tomorrow
    stamp = datetime.datetime.combine(now.date(), datetime.time(23, 59))
print(stamp.strftime("%Y-%m-%d %H:%M:%S +0900"))
STAMPER
)
  fi
fi

# The "nothing new" phrase is content, and lives in _config.yml so the English
# guidelines can name it rather than embed it.
CHECKED=$(sed -n 's/^  checked_empty: *"\(.*\)"$/\1/p' _config.yml | head -1)
CHECKED="${CHECKED:-Checked and empty today}"

KIND="Daily brief"
if [ -n "$ORDINAL" ]; then
  KIND="Daily brief — ${ORDINAL} edition"
fi

cat > "$FILE" <<TEMPLATE
---
title: TODO — the day's lead headline, as a sentence
date: ${STAMP}
kind: ${KIND}
summary: TODO — one line for the index and the feed.
# Up to three of the day's most significant numbers, each one a figure a linked
# source states. Fewer is fine. None is fine. Inventing one to fill the strip is
# not — delete the key rather than manufacture a number.
figures:
  - value: TODO
    label: TODO — whose number is this
    url: https://
sources: []
---

## TOP 3

1. TODO
2. TODO
3. TODO

## Models

TODO

## Agentic AI & Agent Skills

TODO

## MCP & Plug-in

TODO

## Tools & Open Source

TODO

## Community

TODO

## Coverage

- ${CHECKED}: TODO. Unreachable: TODO.
TEMPLATE

echo "$FILE"
echo
echo "Fill it in, then check before committing:" >&2
echo "  - every factual claim traces to an entry in 'sources'" >&2
echo "  - every number in the text appears in a linked source" >&2
echo "  - a section with nothing in it is DELETED, heading and all; name it" >&2
echo "    on the Coverage line instead ('${CHECKED}: ...')" >&2
echo "  - if nothing happened anywhere today, delete this file and publish nothing" >&2
