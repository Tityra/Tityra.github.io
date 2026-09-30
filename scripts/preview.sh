#!/usr/bin/env bash
# Local preview. Usage: ./scripts/preview.sh [port]
set -euo pipefail
cd "$(dirname "$0")/.."
PORT="${1:-4181}"
if ! command -v bundle >/dev/null 2>&1; then
  echo "bundler not found. Install the site's gems first:" >&2
  echo "  gem install bundler && bundle install" >&2
  exit 1
fi
echo "Serving on http://127.0.0.1:${PORT}/ — Ctrl+C to stop."
exec bundle exec jekyll serve --port "$PORT" --livereload
