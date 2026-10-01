#!/usr/bin/env bash
# Publish another brief today, on demand.
#
#   ./scripts/run-brief-now.sh
#
# The daily job fires at 06:00 by itself and needs nothing from anyone. This is
# for the other case: the reader wants a second (or third) brief the same day.
#
# Why not `hermes cron run <id>`, or the dashboard's Run-now button: both claim
# the job's *upcoming occurrence*. Once an occurrence is recorded completed —
# which the first run of the day does — every later claim for it is refused:
#
#   409 {"detail":"Job is already running or was claimed by another scheduler"}
#
# `trigger_job` is the path that does not have that problem. It stamps
# `manual_run_at` and moves `next_run_at` to now, which marks the fire as
# manual, so it is exempt from the once-per-occurrence rule and may be used as
# many times a day as the reader wants. The scheduler picks it up on its next
# tick, inside the gateway, so the run does not die with this terminal.
set -euo pipefail

JOB="${1:-Tityra Daily Brief}"
AGENT="$HOME/.hermes/hermes-agent"
PYTHON="$AGENT/venv/bin/python"

if [ ! -x "$PYTHON" ]; then
  echo "Hermes agent venv not found at $PYTHON" >&2
  exit 1
fi

cd "$AGENT"
exec "$PYTHON" - "$JOB" <<'PY'
import sys

sys.path.insert(0, ".")
from cron.jobs import resolve_job_ref, trigger_job  # noqa: E402

reference = sys.argv[1]
job = resolve_job_ref(reference)
if not job:
    print(f"No cron job matches {reference!r}. `hermes cron list` shows them.", file=sys.stderr)
    raise SystemExit(1)

triggered = trigger_job(job["id"])
if not triggered:
    print(f"Could not trigger {job.get('name', job['id'])}.", file=sys.stderr)
    raise SystemExit(1)

print(f"Triggered {triggered.get('name')} ({triggered['id']}) — the scheduler takes it on its next tick.")
print("It writes a new edition only if there is something the day has not carried yet.")
PY
