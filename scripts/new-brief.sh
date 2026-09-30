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

existing=$(find _posts -maxdepth 1 -name "${DATE}-*.md" -print -quit 2>/dev/null || true)
if [ -n "$existing" ]; then
  echo "A brief already exists for ${DATE}: ${existing}" >&2
  echo "Edit that file rather than adding a second post for the same day." >&2
  exit 3
fi

FILE="_posts/${DATE}-ai-daily-brief.md"
STAMP="${DATE} 09:00:00 +0900"

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

신규 없음

## Agentic AI & Agent Skills

신규 없음

## MCP & Plug-in

신규 없음

## Community

신규 없음
TEMPLATE

echo "$FILE"
echo
echo "Fill it in, then check before committing:" >&2
echo "  - every factual claim traces to an entry in 'sources'" >&2
echo "  - every number in the text appears in a linked source" >&2
echo "  - sections with nothing new say '신규 없음' and stop there" >&2
echo "  - if nothing happened anywhere today, delete this file and publish nothing" >&2
