# Tityra

A brief on technology news. Short, plain, and sourced — every factual claim in
every post traces to a link at the foot of it.

Live at **https://tityra.github.io/**

## The rule that matters

The failure mode of an automated news blog is not dullness, it is **confident
wrongness**: a summary that quietly misstates what happened, published daily
under a real name, with nobody reading it first. It reads exactly as fluently as
a correct one.

[`POLICY_NEWS.md`](POLICY_NEWS.md) is written against that. Nothing without a
source; say only what the source says; no invented numbers; mark the difference
between fact, interpretation and speculation; correct in place and date it.

## Visits

Counted by [GoatCounter](https://www.goatcounter.com/) — no cookies, no personal
data, no cross-site tracking. The public counter endpoint is read back in the
footer to show today's and total reads. Every part of it fails silently: a
blocked request leaves the footer unchanged rather than printing a zero.

## Colours

Four, each with exactly one job. Three come from the CLM research deck this
site's design is taken from; the fourth is the colour the bird actually wears.

| | | job |
| --- | --- | --- |
| **Paper** | `#F0EBDE` | background |
| **Ink** | `#1F2BE0` | body text, links, rules |
| **Deep** | `#11131F` | weight — headlines, the mark, the figures strip |
| **Ring** | `#C8402C` | one marker only: the live dot, and "new since your last visit" |

**Ring is never a text colour.** On paper its contrast is weaker than Ink, so it
marks and does not read. It should appear at most once or twice on a screen; a
third use means it has started decorating, and a marker that decorates stops
meaning anything.

Adding a fifth colour means finding a fifth job first.

## Stack

- GitHub Pages + Jekyll (no build step to maintain; GitHub builds it)
- Markdown posts in `_posts/`
- Newsreader · Hanken Grotesk · DM Mono, one ink on gridded paper

## Structure

```text
index.html            Home — latest briefs
archive.html          Every brief, at /archive/
about.md              What this is, at /about/
feed.xml              Atom feed, at /feed.xml
_posts/YYYY-MM-DD-*.md  Individual briefs
_layouts/             default + post
assets/css/styles.css The design system
POLICY_NEWS.md        Standing editorial policy
USAGE.md              How to write and publish a brief
scripts/new-brief.sh  Creates a dated skeleton; refuses duplicates
scripts/check-brief.sh  Gate before publishing; fails on bad links, TODOs, duplication
scripts/install-skill.sh  Installs the repo skill where the cron runner looks
scripts/run-brief-now.sh  Publishes another brief today, on demand
.hermes/skills/       Agent skill for the daily brief
```

## The daily brief

The recurring post is produced by the Hermes agent skill in
[`.hermes/skills/tityra-daily-brief/`](.hermes/skills/tityra-daily-brief/SKILL.md).
The cron job's only instruction is to run that skill — the research brief, the
editorial rules and the output shape live in the repository, versioned, so they
can be changed without touching the scheduler.

The skill reads [`POLICY_NEWS.md`](POLICY_NEWS.md) as its source of truth, writes
through `scripts/new-brief.sh` (which refuses a second brief for the same date),
and **stops before publishing** unless publishing is explicitly requested.

### Setting this up on a new machine

The skill lives in this repository, so it travels with the checkout. Hermes
loads repo-local skills only from projects you have trusted, and that trust is
recorded per machine in `~/.hermes/config.yaml` under `trusted_project_dirs`.
So one command after cloning:

```bash
hermes skills trust /path/to/Tityra   # repo-local skills in interactive sessions
./scripts/install-skill.sh            # and where the CRON RUNNER looks
```

Both are needed. `trust` loads repo-local skills in sessions started inside the
repository; **a scheduled job is not such a session**, even with `workdir` set
to the repo. Without `install-skill.sh` a cron run reports `Skill(s) not found
and skipped` and carries on without it — which failed quietly here, because the
agent read `SKILL.md` out of the working directory anyway and the output still
looked right.

Re-run `install-skill.sh` whenever `SKILL.md` changes; the repository stays the
source of record.

Then recreate the schedule:

```bash
hermes cron create "0 6 * * *" \
  "Produce today's Tityra daily brief using the tityra-daily-brief skill. \
   Follow it exactly. Do NOT commit or push; leave the file for review." \
  --name "Tityra Daily Brief" --skill tityra-daily-brief \
  --workdir /path/to/Tityra --deliver discord:<channel> \
  --model gpt-6-sol --provider openai-codex
```

The copy under `~/.hermes/skills/` is installed *from* this repository by
`scripts/install-skill.sh` and is not edited in place. The repository is the
source of record; that copy exists only because the cron runner cannot see
repo-local skills.

## Where the brief's research comes from

`scripts/collect-sources.py` fetches public RSS and Atom feeds over plain HTTP
using only the standard library — Google AI, OpenAI, Cloudflare, Hugging Face,
GitHub, arXiv cs.AI and cs.LG, Hacker News, and Reddit when it will answer. **No
API key, no search backend, no tool gateway, no login.**

That is deliberate. The job has already been stopped once by a search backend
becoming unavailable overnight, and a daily publication should not depend on a
credential that can lapse. The collector runs as the cron job's `--script`, so
its output is injected into the agent's prompt: the agent chooses among items
that demonstrably exist rather than recalling items it believes exist.

Install it where Hermes looks, and keep it in step with the repo copy:

```bash
cp scripts/collect-sources.py ~/.hermes/scripts/tityra-collect.py
```

If a feed is unreachable the collector says so by name, and the brief is
required to report that its coverage was incomplete rather than imply a quiet
day.

## Publishing again the same day

The schedule publishes one brief each morning and needs nothing from anyone. To
publish another one the same day:

```bash
./scripts/run-brief-now.sh
```

The run writes a second edition — `_posts/<date>-ai-daily-brief-2.md`, labelled
*Daily brief — second edition* — but **only if something has happened that the
day's earlier briefs do not already carry**. If nothing has, it reports that and
publishes nothing, which is the intended answer rather than a failure.
`check-brief.sh` refuses an edition that re-anchors a source an earlier edition
of the same day used, so a repeat cannot reach the site even by accident.

### Why not `hermes cron run`, or the dashboard's Run-now button

Both of them claim the job's *upcoming occurrence*, and an occurrence can be
completed once. The day's first run — scheduled or manual — records it, and
every later attempt at the same occurrence is refused:

```
409 {"detail":"Job is already running or was claimed by another scheduler"}
Fire claim was not acquired
```

This is the occurrence ledger in `~/.hermes/cron/executions.db` doing its job,
not a stuck lock. The `.fire-*.lock` files in `~/.hermes/cron/` are `flock`
handles, one per job; their presence on disk means nothing and deleting them
fixes nothing. (An earlier version of this README said otherwise. It was wrong.)

`run-brief-now.sh` goes through Hermes' `trigger_job` instead, which stamps the
fire as **manual** — exempt from the once-per-occurrence rule, and usable as
many times a day as you like. The scheduler then runs it inside the gateway on
its next tick, so the run does not die with your terminal.

`hermes cron doctor` reports nothing in either case.

## Local preview

```bash
gem install bundler && bundle install
./scripts/preview.sh          # http://127.0.0.1:4181/
```

GitHub Pages builds and deploys on push to `main`; the local server is only for
checking layout before that.
