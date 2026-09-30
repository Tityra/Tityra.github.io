---
name: tityra-daily-brief
description: "Use when producing the daily AI/LLM industry brief for the Tityra Jekyll blog. Research the last 24 hours across models, agentic AI, MCP and developer communities; apply POLICY_NEWS.md; write a sourced Markdown post into _posts/ via scripts/new-brief.sh; leave it review-ready without publishing unless explicitly requested."
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

**Output language: Korean**, with technical terms left in the original
(Agentic AI, MCP, tool use, context window, fine-tuning — never translated or
paraphrased). The site chrome is English. Change this line and the section
defaults if the blog's language changes.

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

If an area has nothing new in the window, it has nothing new. Record that.

### 3. Write

```bash
./scripts/new-brief.sh            # today, or pass YYYY-MM-DD
```

It prints the path and **exits 3 if a brief already exists for that date** — a
cron can fire twice. On exit 3, edit that brief; never create a second brief for
one day.

**Never delete, rename or overwrite any other post to make room.** Other posts
may share the date and are not yours to remove. If the script refuses and the
existing file is not that day's brief, stop and report it rather than clearing
the way.

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
- `title` is the day's lead headline as a sentence — never "Daily Brief #47".
  A reader scanning the archive should see what happened.
- `summary` is one line, for the index and the feed.
- `figures` is optional: two or three of the day's most significant numbers,
  each `value` plus a short `label` naming whose number it is. Quote them from
  a linked source. Never a number you calculated, and never one lifted out of
  the prose without its attribution.

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

**Do not commit or push unless the user explicitly requests it**, matching the
convention in the other Hermes site skills.

When publishing is requested:

```bash
git add _posts/ && git commit -m "brief: <headline>" && git push
```

GitHub Pages rebuilds on push. Verify:

```bash
gh api repos/Tityra/Tityra.github.io/pages/builds/latest --jq '{status,err:.error.message}'
```

To run unattended, the safer shape is a branch and a pull request rather than a
push to `main`, so a person still says yes before anything appears under the
owner's name:

```bash
git switch -c brief/$(date +%F) && git add _posts/ && git commit -m "brief: …"
git push -u origin HEAD && gh pr create --fill
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
