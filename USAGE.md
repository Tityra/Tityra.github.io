# Writing a brief

## The daily loop

```bash
./scripts/new-brief.sh            # today (Asia/Seoul), or pass YYYY-MM-DD
# fill the file in
./scripts/check-brief.sh _posts/YYYY-MM-DD-ai-daily-brief.md
git add _posts/ && git commit -m "brief: <headline>" && git push
```

`check-brief.sh` is the gate the scheduled job passes through, so run it by hand
too. It fails on a missing field, a leftover `TODO`, an empty body, a figure
without a label or url, more than three figures, and any link that does not
resolve. **If it fails, do not publish** — fix it, or publish nothing.

`new-brief.sh` **exits 3 if a brief already exists for that date**. A daily cron
runs twice more often than you would think — a retry, a job crossing midnight —
and an unasked-for second run must never produce two posts for one day or
overwrite the first.

## Publishing again the same day

Asking for another brief on a day that already has one is allowed:

```bash
./scripts/run-brief-now.sh          # or: ./scripts/new-brief.sh --edition
```

It writes `_posts/<date>-ai-daily-brief-2.md` (then `-3`), labelled *Daily brief
— second edition*, stamped later than every brief already published that day.

An edition carries **only what is new since the earlier one**. `check-brief.sh`
fails it if it re-anchors a source an earlier brief from the same day used, so a
second edition cannot be a reprint of the first. If nothing new has happened,
the correct second edition is none at all.

**If nothing happened anywhere today, delete the file and publish nothing.** An
empty day with no post is correct. A post that exists to keep a streak is the
first step toward inventing significance, which is the same failure as inventing
facts in better clothes.

## Front matter

```yaml
---
title: The day's lead headline, as a sentence
date: 2026-09-30 06:10:00 +0900   # when it was written. NEVER the future:
                                  # Jekyll drops a future-dated post and the
                                  # build still goes green without it.
kind: Daily brief          # or: Weekly brief, Note
summary: One line for the index and the feed.
sources:
  - title: Exact page title
    url: https://…
    outlet: Publisher
---
```

`figures` renders up to three quoted numbers large above the body. It is a
standard part of a brief:

```yaml
figures:
  - value: "1.7x"
    label: Two clustered 64GB DGX Sparks against one, in NVIDIA's own Qwen 3.8 27B test
    url: https://blogs.nvidia.com/blog/local-ai-dgx-spark-64gb-sync/
```

**Every figure is a number a linked source states** — never computed, never
rounded into a better shape, never lifted out of a sentence away from the
attribution that qualifies it. The `label` names whose number it is; the `url`
makes the largest type on the page the most checkable.

Two quotable numbers means two figures. None means none — **an empty strip is
correct, and a manufactured number to fill it is the failure the whole policy
exists to prevent.**

`sources` renders as a numbered list at the foot of the post. Every factual
claim in the body must trace to one of them — that is the whole contract, and
[`POLICY_NEWS.md`](POLICY_NEWS.md) is the long form of it.

**Title the brief with the day's lead headline, not "Daily Brief #47".** A
reader scanning the archive should see what happened, and so should a search
engine.

## Body

Fixed sections, in this order:

```markdown
## TOP 3
1. One line each, link inline.

## Models
## Agentic AI & Agent Skills
## MCP & Plug-in
## Tools & Open Source
## Community
```

- Everything in bullet form. One to two lines per item; itemise sub-points.
- **Keep technical terms in the original** — Agentic AI, MCP, tool use, context
  window, fine-tuning. Do not translate or paraphrase them.
- A section with nothing in it is **deleted, heading and all**, and there is no
  `Coverage` section: the post carries what happened, not the bookkeeping of
  what was looked at. That belongs in the run report to the administrator.
- The exception is coverage that was genuinely broken. If sources could not be
  reached and the day's picture is incomplete, end the brief with one italic
  line saying so and naming them. Only on the days it is true.

**One story, one home.** Each item lives in exactly one section; `TOP 3` is an
index that may point at it. Discussion of an announcement goes in `Community`
and is about what people are saying, not a second telling of the news.
`check-brief.sh` fails if one source anchors items in two body sections.
- No opinion, speculation or forecasting in a daily brief. Only what the primary
  source states.

For an inverted emphasis block, matching the deck's solid nodes:

```html
<div class="callout" markdown="1">
<span class="eyebrow">Label</span>
The claim worth stopping on.
</div>
```

## Before publishing

- Every link resolves and points at what the text says it does.
- Every number in the text appears in a linked source.
- Vendor benchmark claims read as vendor claims — "on the company's own
  numbers", not "the model achieves".
- The headline is supported by the body, not by its most exciting bullet.

## Corrections

Do not delete a wrong claim. Strike it and append at the foot of the post:

```markdown
**Correction, 2026-10-02.** The original said X. The source says Y; the claim
has been corrected above.
```

GitHub Pages rebuilds on push, usually within a minute. Check the build with:

```bash
gh api repos/Tityra/Tityra.github.io/pages/builds/latest --jq '{status,err:.error.message}'
```
