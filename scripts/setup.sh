#!/usr/bin/env bash
# Set this project up on a new machine.
#
#   ./scripts/setup.sh              interactive
#   ./scripts/setup.sh --check      verify an existing install, change nothing
#
# What this script will NOT do: hold a secret. No API key, no bot token and no
# channel id is written into this repository by this script or stored anywhere
# inside it. The one private value it needs — where the brief is delivered — is
# asked for at run time and handed straight to Hermes, which keeps its own
# configuration outside the repo. Everything else the project needs is public
# by design: the research step uses no credential at all.
#
# Re-running is safe. It updates the existing job rather than creating a second.
set -euo pipefail
cd "$(dirname "$0")/.."
REPO="$(pwd)"

CHECK_ONLY=0
[ "${1:-}" = "--check" ] && CHECK_ONLY=1

HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
AGENT="$HERMES_HOME/hermes-agent"
PYTHON="$AGENT/venv/bin/python"
JOB_NAME="${TITYRA_JOB_NAME:-Tityra Daily Brief}"
SCHEDULE="${TITYRA_SCHEDULE:-0 6 * * *}"
MODEL="${TITYRA_MODEL:-gpt-6-sol}"
PROVIDER="${TITYRA_PROVIDER:-openai-codex}"

ok()   { printf '  ok    %s\n' "$1"; }
warn() { printf '  WARN  %s\n' "$1"; }
die()  { printf '  FAIL  %s\n' "$1" >&2; exit 1; }

echo "Tityra setup — $REPO"
echo

# ---------------------------------------------------------------- tools ----
echo "Prerequisites"
command -v git     >/dev/null || die "git is not installed"
command -v python3 >/dev/null || die "python3 is not installed (the scripts are stdlib-only)"
ok "git $(git --version | awk '{print $3}'), python $(python3 -c 'import sys;print("%d.%d"%sys.version_info[:2])')"

[ -f "$REPO/POLICY_NEWS.md" ] && [ -d "$REPO/_posts" ] \
  || die "this does not look like the Tityra repository"
ok "repository layout"

if [ -x "$PYTHON" ]; then
  ok "Hermes agent at $AGENT"
else
  warn "no Hermes agent at $AGENT"
  warn "install Hermes first, or set HERMES_HOME; the blog itself still works without it,"
  warn "but nothing will publish on a schedule."
fi

# -------------------------------------------------------------- remotes ----
echo
echo "Publishing"
if git remote get-url origin >/dev/null 2>&1; then
  ok "origin $(git remote get-url origin)"
  if git ls-remote --exit-code origin >/dev/null 2>&1; then
    ok "origin is reachable and this machine can authenticate to it"
  else
    warn "cannot reach origin — the job commits and pushes on its own, so fix this first:"
    warn "  gh auth login      (or add this machine's SSH key to the account)"
  fi
else
  warn "no git remote named origin; the job has nowhere to push"
fi

# ---------------------------------------------------------------- gates ----
echo
echo "Gates"
for s in check-brief.sh check-english.sh new-brief.sh install-skill.sh; do
  [ -x "$REPO/scripts/$s" ] || die "scripts/$s is missing or not executable"
done
ok "all four scripts present and executable"
./scripts/check-english.sh >/dev/null && ok "guidelines are English-only"
latest="$(ls -1 _posts/*-ai-daily-brief*.md 2>/dev/null | tail -1 || true)"
if [ -n "$latest" ]; then
  if ./scripts/check-brief.sh "$latest" >/dev/null 2>&1; then
    ok "the most recent brief passes the gate ($(basename "$latest"))"
  else
    warn "the most recent brief does not pass the gate; run ./scripts/check-brief.sh $latest"
  fi
fi

# ------------------------------------------------------------ watchlist ----
echo
echo "Watchlist reachability — watchlist.yml (no credential is used for any of these)"
python3 - "$REPO" <<'PROBE'
import re, sys, time, urllib.request, pathlib
watchlist = pathlib.Path(sys.argv[1], "watchlist.yml")
urls = sorted(set(re.findall(r"^\s+url:\s*(\S+)", watchlist.read_text(encoding="utf-8"), re.M)))
agent = ("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 "
         "(KHTML, like Gecko) Chrome/124.0 Safari/537.36")
bad = []
for url in urls:
    # Reddit 429s a burst, so this check used to report three false failures
    # every run. A check that cries wolf is a check nobody reads.
    if "reddit.com" in url:
        time.sleep(4)
    try:
        request = urllib.request.Request(url, headers={"User-Agent": agent, "Accept": "text/html"})
        if urllib.request.urlopen(request, timeout=20).status != 200:
            bad.append(url)
    except Exception as error:  # noqa: BLE001 - anything that is not a page is a miss
        bad.append(f"{url} ({getattr(error, 'code', type(error).__name__)})")
print(f"  ok    {len(urls) - len(bad)}/{len(urls)} watchlist pages answered")
for url in bad:
    print(f"  WARN  unreachable: {url}")
if bad:
    print("  Reddit answers 429 to burst requests; one at a time is usually fine.")
PROBE

# ------------------------------------------------------------- the job ----
if [ "$CHECK_ONLY" -eq 1 ] || [ ! -x "$PYTHON" ]; then
  echo
  [ "$CHECK_ONLY" -eq 1 ] && echo "--check: stopping before any change."
  exit 0
fi

echo
echo "Skill"
./scripts/install-skill.sh >/dev/null && ok "skill installed where the cron runner looks"

echo
echo "Scheduled job"
echo "  The brief is delivered to a chat channel. That id is private, so it is"
echo "  not stored in this repository — it goes straight into Hermes' own config."
echo "  Set TITYRA_DELIVER to skip this prompt (e.g. discord:123456789)."
DELIVER="${TITYRA_DELIVER:-}"
if [ -z "$DELIVER" ]; then
  if [ -t 0 ]; then
    printf '  deliver to (e.g. discord:123456789, blank to leave undelivered): '
    read -r DELIVER
  else
    warn "not a terminal and TITYRA_DELIVER is unset; the job will be created undelivered"
  fi
fi
if [ -n "$DELIVER" ]; then
  case "$DELIVER" in
    *:*) ok "delivery target accepted (…${DELIVER: -4})" ;;
    *)   die "expected the form <channel>:<id>, for example discord:123456789" ;;
  esac
fi

JOB_NAME="$JOB_NAME" SCHEDULE="$SCHEDULE" MODEL="$MODEL" PROVIDER="$PROVIDER" \
REPO="$REPO" DELIVER="$DELIVER" "$PYTHON" - <<'PY'
import os, sys
sys.path.insert(0, os.path.join(os.environ["HOME"], ".hermes", "hermes-agent"))
os.chdir(os.path.join(os.environ["HOME"], ".hermes", "hermes-agent"))
from cron.jobs import create_job, resolve_job_ref, update_job

repo = os.environ["REPO"]
with open(os.path.join(repo, ".hermes", "job-prompt.txt"), encoding="utf-8") as handle:
    prompt = handle.read().strip()

fields = {
    "prompt": prompt,
    "skill": "tityra-daily-brief",
    "model": os.environ["MODEL"],
    "provider": os.environ["PROVIDER"],
    "workdir": repo,
    "script": None,          # the agent researches; there is no collector
}
deliver = os.environ.get("DELIVER") or None
if deliver:
    fields["deliver"] = deliver

try:
    existing = resolve_job_ref(os.environ["JOB_NAME"])
except Exception:
    existing = None

if existing:
    job = update_job(existing["id"], fields)
    print(f"  ok    updated existing job {job['id']}")
else:
    job = create_job(
        prompt=prompt,
        schedule=os.environ["SCHEDULE"],
        name=os.environ["JOB_NAME"],
        skill="tityra-daily-brief",
        model=os.environ["MODEL"],
        provider=os.environ["PROVIDER"],
        workdir=repo,
        deliver=deliver,
    )
    print(f"  ok    created job {job['id']}")
print(f"  ok    schedule {job['schedule']['expr']}, next run {job.get('next_run_at')}")
print(f"  ok    delivery {'configured' if job.get('deliver') else 'NOT set — it will publish but not tell anyone'}")
PY

# ------------------------------------------------------------ leftovers ----
cat <<'DONE'

Still yours to do, because no script should do them for you:

  1. Authenticate this machine to the git host, if the check above warned.
     The job pushes by itself; it cannot answer a password prompt.
  2. Give Hermes its model provider credential, through Hermes' own config —
     not through this repository, and not through any file in it.
  3. Point the host's Pages settings at this repository's default branch.
  4. If you use the analytics counter, create the site on the counter's
     dashboard; the code in the layout is a public endpoint and needs no key.

Verify at any time, changing nothing:   ./scripts/setup.sh --check
DONE
