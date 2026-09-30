#!/usr/bin/env bash
# Every policy and guideline in this repository is written in English.
#
# This is the check that makes that true rather than intended. It fails if any
# non-ASCII character appears in a governing document. Posts are content and are
# exempt; the language posts are written in is set in _config.yml.
#
#   ./scripts/check-english.sh
#
# Implemented in python because BSD grep (macOS) has no -P, and a grep that
# errors out is indistinguishable from a grep that found nothing - a check that
# cannot fail is worse than no check.
set -euo pipefail
cd "$(dirname "$0")/.."

exec python3 - "$@" <<'PY'
import pathlib
import sys
import unicodedata

root = pathlib.Path(".")
governing = [root / name for name in ("POLICY_NEWS.md", "USAGE.md", "README.md", "CONTRIBUTING.md")]
governing += sorted(root.glob(".hermes/**/*.md"))

checked = 0
bad = []
for path in governing:
    if not path.is_file():
        continue
    checked += 1
    for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        # Non-ASCII *letters* mean another language. Non-ASCII punctuation
        # (em dash, ellipsis, curly quotes, middot, arrows) is English
        # typography and must not trip this check.
        offending = {ch for ch in line if ord(ch) > 0x7F and unicodedata.category(ch).startswith("L")}
        if offending:
            bad.append((path, number, line.strip()[:96], "".join(sorted(offending))))

if bad:
    for path, number, line, chars in bad[:40]:
        print(f"NOT ENGLISH — {path}:{number}  [{chars}]")
        print(f"    {line}")
    print()
    print("Policies and guidelines must be written in English.", file=sys.stderr)
    print("If a guideline needs a non-English literal — a phrase that posts must", file=sys.stderr)
    print("contain — put it in _config.yml and refer to it by name instead.", file=sys.stderr)
    sys.exit(1)

print(f"All {checked} governing documents are English-only.")
PY
