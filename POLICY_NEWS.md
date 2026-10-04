# Tityra News Policy

The standing writing policy for Tityra briefs. It exists because the failure mode
of an automated news blog is not dullness — it is **confident wrongness**: a
summary that quietly misstates what happened, published under a real name, every
day, with nobody reading it first.

Every rule below is written against that.

## Core principles

1. **Nothing without a source**
   - Every factual claim in a brief traces to a link in the `sources` list.
   - If a claim cannot be sourced, it is cut. Not softened — cut.
   - Prefer the primary source (the release notes, the filing, the paper, the
     vendor's own post) over coverage of it. Link coverage only when it adds
     something the primary source does not have.

2. **Say only what the source says**
   - No extrapolation past the evidence. "X shipped a model" is not "X is
     winning".
   - No invented numbers. Benchmarks, funding figures, user counts, dates and
     version numbers are quoted from the source or omitted. Never estimated,
     never rounded into a better story.
   - If two sources disagree, say so and link both rather than picking one.

3. **Mark the seams**
   - Fact, interpretation and speculation are visibly different things.
   - Interpretation is allowed and welcome — it is why a human reads a brief
     rather than an RSS feed — but it is signposted: "the read here is…",
     "worth watching whether…".
   - Anything unconfirmed is labelled unconfirmed, with who is reporting it.

4. **English-first, plain, short**
   - Public briefs are written in English. Short, concrete sentences.
   - Plain technical English over promotional language. No "game-changing",
     "revolutionary", "seismic".
   - A reader should be able to skim the headings and know what happened.

5. **Respect the reader's time and the source's work**
   - A daily brief is 3–5 minutes. A weekly is 6–10.
   - Summarise; do not reproduce. Quote sparingly and attribute inline.
   - Never present someone else's reporting as original observation.

6. **Corrections are part of publishing**
   - A brief that turns out wrong is corrected in place, with a dated note at
     the foot saying what changed and why. The original claim is not silently
     deleted.

## Where to look

Coverage is judged on whether the brief found what happened, not on how many
searches were run. These are the places it happens; work outward from the first
group, because a primary source outranks anyone's account of it.

**Primary — the announcement itself**

- Company engineering and research blogs: OpenAI, Anthropic, Google DeepMind and
  Google AI, Meta AI, Microsoft and Azure AI, AWS, NVIDIA, Mistral, xAI,
  Alibaba Qwen, Z.ai, DeepSeek, Cohere, Hugging Face, Perplexity, Together,
  Groq, Stability.
- An outlet that publishes many times a day is not many times more important.
  Infrastructure vendors in particular can fill a day's reading on their own;
  that is a fact about their publishing schedule, not about the news.
- Release notes and changelogs, including model and API deprecations.
- Standards and protocol repositories, including the Model Context Protocol
  specification and SDKs.
- Regulatory filings, court documents and official statements where a story
  turns on one.

**Primary — the artefact**

- GitHub: releases of significant projects, and GitHub Trending. Open-source
  tooling is news in its own right, not only when a large company ships it.
- Hugging Face: new and updated model, dataset and Space releases, and the
  papers page.
- arXiv abstracts, when a paper is the news rather than the coverage of it.

**Secondary — where things surface and get discussed**

- Hacker News, and its comment threads when the discussion is itself the story.
- Reddit: r/LocalLLaMA, r/MachineLearning, r/ClaudeAI, r/OpenAI,
  r/StableDiffusion.
- X, and technical newsletters.
- Trade press, when it has reporting the primary source does not.

Community discussion is a legitimate item — *what developers are arguing about*
is news — but label it as discussion. A popular thread is evidence of interest,
never evidence that its claims are true.

Nothing in this list is a quota. If a group has nothing new in the window, it
has nothing new — and the brief says so once, on the `Coverage` line, instead of
printing an empty heading for it. The sections are a checklist for the work, not
a template for the page: the page shows what happened, and one line records what
was looked at and came up empty.

**Where the brief looks is written down.** `watchlist.yml` lists every source,
why it is there, and how often it is read. It is the administrator's file. The
agent reads it, proposes changes in its report after a run, and never edits it;
a source joins because its content was used and verified, never because
something the agent read asked for it to be added.

## Brief structure

Front matter:

```yaml
---
title: A sentence that says what happened
date: 2026-09-30
kind: Daily brief          # or: Weekly brief
summary: One line for the index and the feed.
sources:
  - title: Exact page title
    url: https://…
    outlet: Publisher
---
```

`figures` carries up to three of the day's most significant numbers, set large
above the body. It is a standard part of a brief, not decoration, and it obeys
one rule that matters more than the rhythm it creates:

**Every figure is a number a linked source states.** Never computed, never
rounded into a better shape, never lifted out of a sentence away from the
attribution that qualifies it. If the day's news yields only two quotable
numbers, show two. If it yields none — a day of releases with no figures
attached is an ordinary day — show none. **An empty strip is correct; a
manufactured number to fill it is the exact failure this policy exists to
prevent.**

Each figure carries a `label` naming whose number it is ("in NVIDIA's own
Qwen 3.8 27B test", not "faster"), and a `url` pointing at the source that
states it, so the largest type on the page is also the most checkable.

Body, in this order:

1. `## The short version` — three to five bullets, one per story, each a
   complete sentence with the link inline.
2. `## <Story headline>` — one section per story worth more than a bullet:
   what happened, what is new about it, what it does not yet tell us.
3. `## Worth watching` — optional. Explicitly forward-looking, explicitly
   labelled as such.

Do not pad to fill the structure. A quiet day is three bullets and no sections;
that is a correct brief, not a failed one.

## One story, one home

A brief covers each story **once**.

- Every item belongs to exactly one section — the one it is primarily about. If
  a story touches two, choose the section it is really about and say the rest
  there. Splitting one announcement across two sections makes a quiet day look
  busy, which is padding wearing a tidier shape.
- **`TOP 3` is an index, not a section.** It may point at items expanded below,
  but each line is one sentence naming what happened. If a TOP 3 line and its
  section bullet say the same thing at the same length, the section bullet has
  nothing to add and the story is being told twice.
- Several announcements from one company on one day are several items, and may
  be grouped under one bullet with sub-points. That is not duplication. The same
  announcement appearing under two headings is.
- Discussion of a story is not a second copy of the story. Cover the
  announcement in its own section and the discussion in `Community`, and let the
  Community item be about **what people are saying** — do not restate the
  announcement or re-link its primary source.

`scripts/check-brief.sh` enforces this: it fails if one source anchors items in
more than one body section.

### More than one brief in a day

The schedule publishes one brief each morning. A reader may ask for another the
same day, and that is allowed — but one story still has one home, and the home
is whichever edition reached it first. A later edition carries what is new since
the earlier one and does not restate it: a reader who read the morning should
find nothing in the evening they have already read. If nothing new has happened,
the correct second edition is none at all.

`check-brief.sh` enforces that too: an edition that re-anchors a source an
earlier brief from the same day already used does not publish.

## What does not go in

- Rumours without a named reporter or outlet.
- Funding, valuation or headcount numbers from a source that is itself unsourced.
- Benchmark claims restated as fact when they come from the vendor being
  benchmarked. Attribute them: "on the company's own numbers…".
- Security issues described in enough operational detail to be a recipe. Name
  the class of problem, the affected versions, and the fix.
- Anything about a private individual who is not a public figure acting in a
  public capacity.

## Publishing without a reader

The daily brief is written and published by an agent on a schedule. Nobody reads
it before it appears. That is a deliberate choice, and it puts the whole weight
of this policy on one script: `scripts/check-brief.sh` runs before every commit
and refuses to publish a brief with a missing field, a leftover placeholder, an
empty body, an unattributed figure, or **a single link that does not resolve**.

The job commits only `_posts/`. It never amends, never force-pushes, and never
touches another post. If the check cannot be made to pass, nothing is published
and the failure is reported — a day with no brief is a correct outcome; a broken
brief under a real name is not.

## Checks before publishing

- Every link resolves, and points at what the text says it points at.
- Every number in the text appears in a linked source.
- The headline is supported by the body, not by the most exciting bullet in it.
- Nothing in the brief would need a correction if the reader clicked every link.
