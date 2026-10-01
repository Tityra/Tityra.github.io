#!/usr/bin/env bash
# Install this repository's Hermes skill into the profile skill directory.
#
#   ./scripts/install-skill.sh
#
# The repository is the source of record for the skill; this copies it to where
# the Hermes *cron runner* can find it.
#
# `hermes skills trust <repo>` makes repo-local skills load in sessions started
# inside the repository — but a scheduled job is not such a session, even with
# workdir set to the repo. A cron run without this step reports:
#
#   Skill(s) not found and skipped: tityra-daily-brief
#
# and proceeds without it. That failed quietly on 2026-09-30 and 2026-10-01: the
# agent read SKILL.md out of the working directory anyway, so the output still
# looked right and the warning sat unread in the run report.
#
# Run this once per machine, and again whenever SKILL.md changes.
set -euo pipefail
cd "$(dirname "$0")/.."

SRC=".hermes/skills"
DEST="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}/research"

if [ ! -d "$SRC" ]; then
  echo "no skills in $SRC" >&2
  exit 1
fi

mkdir -p "$DEST"
installed=0
for dir in "$SRC"/*/; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  rm -rf "${DEST:?}/$name"
  cp -R "$dir" "$DEST/$name"
  echo "installed $name -> $DEST/$name"
  installed=$((installed + 1))
done

if [ "$installed" -eq 0 ]; then
  echo "nothing to install" >&2
  exit 1
fi

echo
echo "Verify the runner can see it:"
echo "  hermes skills list | grep tityra"
echo
echo "After a scheduled run, check the report does NOT say 'Skill(s) not found':"
echo "  grep -l 'not found' ~/.hermes/cron/output/*/*.md"
