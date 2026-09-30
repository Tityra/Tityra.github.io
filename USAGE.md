# Writing a brief

## The daily loop

```bash
./scripts/new-brief.sh            # today (Asia/Seoul), or pass YYYY-MM-DD
# fill the file in
git add _posts/ && git commit -m "brief: <headline>" && git push
```

`new-brief.sh` **exits 3 if a brief already exists for that date**. A daily cron
runs twice more often than you would think — a retry, a manual re-run, a job
crossing midnight — and must never produce two posts for one day or overwrite
the first.

**If nothing happened anywhere today, delete the file and publish nothing.** An
empty day with no post is correct. A post that exists to keep a streak is the
first step toward inventing significance, which is the same failure as inventing
facts in better clothes.

## Front matter

```yaml
---
title: The day's lead headline, as a sentence
date: 2026-09-30 09:00:00 +0900
kind: Daily brief          # or: Weekly brief, Note
summary: One line for the index and the feed.
sources:
  - title: Exact page title
    url: https://…
    outlet: Publisher
---
```

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
## Community
```

- Everything in bullet form. One to two lines per item; itemise sub-points.
- **Keep technical terms in the original** — Agentic AI, MCP, tool use, context
  window, fine-tuning. Do not translate or paraphrase them.
- A section with nothing new says the site's `brief.empty_section` phrase
  (set in `_config.yml`) and stops. Do not pad it.
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
