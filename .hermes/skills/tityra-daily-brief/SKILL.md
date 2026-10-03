---
name: tityra-daily-brief
description: "Use when producing the daily AI/LLM industry brief for the Tityra Jekyll blog. Research the last 24 hours across models, agentic AI, MCP, tools and developer communities; apply POLICY_NEWS.md; write a sourced Markdown post into _posts/ via scripts/new-brief.sh; validate it with scripts/check-brief.sh and publish only if that passes."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [macos, linux]
metadata:
  hermes:
    tags: [tityra, jekyll, ai-news, daily-brief, publishing]
    related_skills: [litebites-paper-research]
---

# Tityra Daily Brief

## Overview

Produce one day's brief for the Tityra blog: research the last 24 hours, write a
Markdown post where every factual claim carries a link, and leave it ready for
review.

Resolve the target repository from the user's supplied path or the current Git
root containing `POLICY_NEWS.md`, `USAGE.md` and `_config.yml`. Do not depend on
a machine-specific absolute path.

**`POLICY_NEWS.md` in the repository is the local source of truth.** Read it and
the most recent brief in `_posts/` before drafting; repository conventions may
change after this skill is written, and the policy wins wherever the two differ.

**Output language: English**, matching the site chrome and the published
archive, with technical terms left in the original (Agentic AI, MCP, tool use,
context window, fine-tuning — never translated or paraphrased).

The language and the exact phrases for an empty section live in `_config.yml`
under `brief.*`. Change them there, not here.

## When to Use

- The scheduled daily brief.
- A manual re-run for a specific date.
- Revising a brief for accuracy after publication (see Corrections).

Do **not** use this to write opinion pieces, explainers, or paper summaries.
Paper work belongs to LiteBites.

## Procedure

### 1. Fix the window

Run `date` first and state the 24-hour window explicitly in your working notes.
Everything below is judged against that window; "recent" is not good enough.

The repository timezone is `Asia/Seoul` (`_config.yml`).

### 2. Research

Nothing is injected into your prompt. **You do the research**, with the fetch
tool, starting from the watchlist below. There is no feed collector any more and
no search backend: what you publish is what you went and read.

**First, read what this blog has already said.** Open the three most recent
`_posts/*-ai-daily-brief*.md` and note every `url:` under their `sources:`. A
story this blog has already carried is not news again, and **if one outlet led
the previous brief it does not lead this one** — unless the new story is plainly
bigger than everything else you found, in which case say in the brief why.

**Then work the watchlist.** These are pages, not feeds; read them and follow
what looks significant through to the thing itself.

| | where |
| --- | --- |
| **Labs and model vendors** | [OpenAI](https://openai.com/news/) · [Anthropic](https://www.anthropic.com/news) · [Google AI](https://blog.google/technology/ai/) · [Google DeepMind](https://deepmind.google/discover/blog/) · [Mistral](https://mistral.ai/news) · [Alibaba Qwen](https://qwenlm.github.io/blog/) · [Z.ai / Zhipu](https://z.ai/) · [DeepSeek](https://api-docs.deepseek.com/news) · [xAI](https://x.ai/news) · [NVIDIA](https://blogs.nvidia.com/) · [Microsoft](https://news.microsoft.com/source/topics/ai/) |
| **Artefacts** | [Hugging Face blog](https://huggingface.co/blog) · [Hugging Face papers](https://huggingface.co/papers) · [GitHub Trending](https://github.com/trending) · [arXiv cs.AI](https://arxiv.org/list/cs.AI/recent) · [arXiv cs.CL](https://arxiv.org/list/cs.CL/recent) · [arXiv cs.LG](https://arxiv.org/list/cs.LG/recent) |
| **Discussion** | [Hacker News](https://news.ycombinator.com/) · [r/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/) · [r/MachineLearning](https://www.reddit.com/r/MachineLearning/) · [r/ClaudeAI](https://www.reddit.com/r/ClaudeAI/) · [r/OpenAI](https://www.reddit.com/r/OpenAI/) |

The list is a floor, not a ceiling. If a story points somewhere not on it, go
there. If a page has moved, say so in the brief rather than quietly skipping it.

**Three things this method does not give you for free, so you have to do them
by hand:**

1. **Dates.** A newsroom page has no publication window. Before an item goes in
   the brief, open it and confirm it was published in the last 24 hours. An
   undated item is not a dated item — leave it out or say the date is unclear.
   This is the one guarantee the old feed collector gave you and this does not.
2. **Reddit throttles bursts.** Requesting several subreddits back to back gets
   you `429`. Space them out, and if one still refuses, name it in Coverage
   rather than letting its silence read as a quiet day.
3. **X is not reachable** without a credential this job does not have. Do not
   cite it from memory. If a story is only on X, it is not yet a story you can
   publish; wait for the primary source.

**Cloudflare is not on the watchlist.** It publishes roughly ten times a day,
which is why three briefs in a row once led with it — not because its news was
the biggest, but because it was the loudest thing in front of the agent. If a
Cloudflare announcement is genuinely the day's biggest AI story you may still
carry it, from its own blog, but it has to earn the slot against everything else
you read.

**Volume is never the signal.** An organisation that posts more often is not
more important. Judge each item on what it changes for someone building with
this technology.

### 2b. Searching, when it is available

Cover four areas. **Search at least two or three times per area** — a single
query is not coverage.

| area | what counts |
| --- | --- |
| **Models** | new model releases, version updates, benchmarks, pricing, deprecations and policy changes (OpenAI, Anthropic, Google, Meta, Mistral, xAI, Qwen, DeepSeek, Cohere, NVIDIA, …) |
| **Agentic AI & Agent Skills** | agent frameworks and products, Agent Skills, notable adoption |
| **MCP & Plug-in** | Model Context Protocol releases, spec changes, SDKs, significant integrations |
| **Tools & Open Source** | AI services and products, notable open-source releases, and developer tools worth knowing about — the practical layer between a model and the work |
| **Community** | what developers are actually discussing and shipping |

`POLICY_NEWS.md` has the full **"Where to look"** list. Work it in this order,
because a primary source outranks anyone's account of it:

1. **The announcement** — company engineering and research blogs (OpenAI,
   Anthropic, Google DeepMind and Google AI, Meta AI, Microsoft and Azure AI,
   AWS, NVIDIA, Mistral, xAI, Qwen, DeepSeek, Cohere, Hugging Face, Cloudflare,
   Perplexity, Together, Groq, Stability), release notes and changelogs, the MCP
   specification and SDK repositories, and official filings or statements.
2. **The artefact** — GitHub releases and GitHub Trending; Hugging Face model,
   dataset, Space and paper pages; arXiv abstracts when the paper is the news.
3. **Where it surfaces** — Hacker News and its threads, Reddit (r/LocalLLaMA,
   r/MachineLearning, r/ClaudeAI, r/OpenAI, r/StableDiffusion), X, technical
   newsletters, and trade press when it has reporting the primary source lacks.

If you only find secondary coverage, go and find the primary source and link
that. Link coverage only when it adds something the primary source does not
have.

Community discussion is a legitimate item — what developers are arguing about is
news — but **label it as discussion**. A popular thread is evidence of interest,
never evidence that its claims are true.

None of this is a quota. Breadth is worth nothing if it turns into padding: an
empty section is a correct answer, and a fabricated one is not.

**If web search starts failing repeatedly, stop and say so** rather than
producing a thin brief that looks like a quiet news day. A brief that silently
under-reports is worse than one that admits its coverage was broken.

The search backend is **intermittently** unavailable — on 2026-10-01 the 06:00
run could not search, a different job searched fine at 07:06, and attempts after
09:00 failed again. The schedule fires once a day, so a bad window means no
brief that morning. Stopping cleanly and saying why is still the right move: a brief that
silently under-reports is worse than a day with none, and the report says plainly
that search was the blocker rather than that the news was quiet.

If an area has nothing new in the window, it has nothing new. Record that.

### 3. Write

```bash
./scripts/new-brief.sh            # today, or pass YYYY-MM-DD
```

It prints the path and **exits 3 if a brief already exists for that date**.

**On exit 3, check whether the day is already done:**

```bash
./scripts/check-brief.sh _posts/<the existing file>
```

If it **fails**, the earlier attempt left the brief incomplete. Finish it in
place — one brief, repaired, not a second one beside it.

If it **passes**, this morning's brief is already out. You are now in an extra
run, because the schedule fires once and it has already fired: someone asked for
this one. More than one brief a day is allowed, on one condition.

**The condition: an edition carries only what the day has not carried yet.**
Re-read the brief or briefs already published today and list the sources they
stand on. Then look at what the window holds now. If everything in it is already
covered, publish nothing and say so — "today's brief is already out, and nothing
has happened since" is a complete, correct report. A second edition that
restates the first is the redundancy this whole policy exists to prevent.

If there *is* something new:

```bash
./scripts/new-brief.sh --edition
```

It writes `_posts/<date>-ai-daily-brief-2.md` (then `-3`, and so on), marks it
`Daily brief — second edition`, and stamps it later than every brief already
published that day so the day reads in order. `check-brief.sh` then refuses the
edition if it re-anchors any source an earlier edition of the same day used.

Write the edition as what changed since the last one. Do not re-summarise the
morning for context; the earlier brief is one click away and still true.

**Never delete, rename or overwrite any other post to make room** — not the
morning brief, not an earlier edition, not a post that merely shares the date.
If the script refuses and the existing file is not that day's brief, stop and
report it rather than clearing the way.

Fill in the skeleton, keeping its sections and order: `TOP 3`, `Models`,
`Agentic AI & Agent Skills`, `MCP & Plug-in`, `Tools & Open Source`,
`Community`.

Rules, all of which restate `POLICY_NEWS.md`:

- **Everything in bullet form.** One or two lines per item; itemise sub-points
  rather than writing paragraphs.
- **Every item carries its source** — title, publisher and date in the text, URL
  in the `sources:` front matter list. An item that cannot be sourced is cut,
  not softened.
- **Numbers are quoted, never estimated.** If a figure is not in a linked
  source, it does not appear.
- **Vendor claims are attributed as vendor claims**: "on the company's own
  numbers", not "the model achieves".
- **No opinion, speculation or forecasting.** State what the primary source
  states. This is stricter than an ordinary news post and it is deliberate.
- **A section with nothing new says the `brief.empty_section` phrase from
  `_config.yml` and stops.** Do not pad it.
- **One story, one home.** Each item belongs to exactly one section. If a story
  touches two, pick the one it is really about. Splitting one announcement
  across two headings makes a quiet day look busy — padding in a tidier shape —
  and `scripts/check-brief.sh` fails on it.
- **`TOP 3` is an index.** One sentence per line naming what happened, pointing
  at the item below. If a TOP 3 line and its section bullet say the same thing
  at the same length, the bullet adds nothing.
- **Discussion is not a second copy of the story.** Put the announcement in its
  own section and the argument in `Community`, and make the Community item about
  what people are *saying* — do not restate the announcement or re-link its
  primary source.
- `title` is the day's lead headline as a sentence — never "Daily Brief #47".
  A reader scanning the archive should see what happened.
- `summary` is one line, for the index and the feed.
- `figures` is **standard, not optional**: up to three of the day's most
  significant numbers, set large above the body. Each has a `value`, a `label`
  naming whose number it is ("in Cloudflare's own internal usage", not "cost
  saving"), and a `url` pointing at the source that states it.

  **Every figure must be a number a linked source states.** Never computed,
  never rounded into a better shape, never lifted away from the attribution
  that qualifies it. Pick them from the day's most significant items, not the
  largest digits available.

  If the day yields only two quotable numbers, give two. If it yields none — a
  day of releases with no figures attached is an ordinary day — give none and
  omit the key. An empty strip is correct; **a manufactured number to fill it is
  the exact failure this skill exists to prevent.**

### 4. Check before handing over

- Every link resolves and points at what the text says it points at.
- Every number in the body appears in a linked source.
- The headline is supported by the body, not by its most exciting bullet.
- `sources:` is populated and every entry has `title`, `url`, `outlet`.

### 5. Report

Reply with the three headlines only, one line each, plus the path to the file.
No commentary.

**If nothing happened in any area during the window: create no file.** Report
the `brief.no_news_report` phrase from `_config.yml`, and the sources you
checked. A day with no post is a correct outcome; a post that exists to keep a
streak is the first step toward inventing significance, which is the same
failure as inventing facts.

## Publishing

The daily brief **publishes itself**. Nobody reads it before it goes out, so the
gate is the check, not a person:

```bash
./scripts/check-brief.sh _posts/<the file you wrote>
```

It fails on a missing title, date, summary or `sources`; on any leftover `TODO`;
on an empty body; on a figure without a `label` or `url`; on more than three
figures; and on **any link that does not resolve**.

**Only if it passes:**

```bash
git add _posts/ && git commit -m "brief: <headline>" && git push
```

Commit **only** `_posts/`. Never `git add -A`, never amend, never force-push,
never touch another post. If the check fails, fix what it names and run it
again. **If it cannot be made to pass, publish nothing and report why** — a day
with no brief is a correct outcome, and a broken brief under the owner's name is
not.

GitHub Pages rebuilds on push. Verify:

```bash
gh api repos/Tityra/Tityra.github.io/pages/builds/latest --jq '{status,err:.error.message}'
```

## Corrections

Never delete a wrong claim. Strike it and append at the foot of the post:

```markdown
**Correction, YYYY-MM-DD.** The original said X. The source says Y; the claim
has been corrected above.
```

## Why the rules are this strict

The failure mode of an automated news blog is not dullness, it is **confident
wrongness**: a summary that quietly misstates what happened — a version number
off by one, a benchmark credited to the wrong model, a rumour promoted to a
fact — published under a real name, daily, with nobody reading it first. It
reads exactly as fluently as a correct one. Fluency is free; accuracy is not.
