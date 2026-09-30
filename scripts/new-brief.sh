#!/usr/bin/env bash
# Create the skeleton for a daily brief.
#
#   ./scripts/new-brief.sh              # today, Asia/Seoul
#   ./scripts/new-brief.sh 2026-10-01   # a specific date
#
# Exits 3 if a brief already exists for that date. A daily cron can run twice -
# a retry, a manual re-run, a clock crossing midnight - and must not produce two
# posts for one day or silently overwrite the first.
set -euo pipefail
cd "$(dirname "$0")/.."

DATE="${1:-$(TZ=Asia/Seoul date +%F)}"
if ! [[ "$DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "usage: $0 [YYYY-MM-DD]" >&2
  exit 2
fi

# Only a *brief* for this date blocks a new one. Matching any post for the date
# was wrong: the agent's route around it was to delete the other post, which is
# how the launch note was lost on 2026-09-30.
existing=$(find _posts -maxdepth 1 -name "${DATE}-ai-daily-brief.md" -print -quit 2>/dev/null || true)
if [ -n "$existing" ]; then
  echo "A brief already exists for ${DATE}: ${existing}" >&2
  echo "Edit that file. Never delete or overwrite another post to make room." >&2
  exit 3
fi

FILE="_posts/${DATE}-ai-daily-brief.md"
STAMP="${DATE} 09:00:00 +0900"

# The "nothing new" phrase is content, and lives in _config.yml so the English
# guidelines can name it rather than embed it.
EMPTY=$(sed -n 's/^  empty_section: *"\(.*\)"$/\1/p' _config.yml | head -1)
EMPTY="${EMPTY:-Nothing new}"

cat > "$FILE" <<TEMPLATE
---
title: TODO — the day's lead headline, as a sentence
date: ${STAMP}
kind: Daily brief
summary: TODO — one line for the index and the feed.
sources: []
---

## TOP 3

1. TODO
2. TODO
3. TODO

## Models

${EMPTY}

## Agentic AI & Agent Skills

${EMPTY}

## MCP & Plug-in

${EMPTY}

## Tools & Open Source

${EMPTY}

## Community

${EMPTY}
TEMPLATE

echo "$FILE"
echo
echo "Fill it in, then check before committing:" >&2
echo "  - every factual claim traces to an entry in 'sources'" >&2
echo "  - every number in the text appears in a linked source" >&2
echo "  - sections with nothing new say '${EMPTY}' and stop there" >&2
echo "  - if nothing happened anywhere today, delete this file and publish nothing" >&2
