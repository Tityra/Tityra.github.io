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
  Alibaba Qwen, DeepSeek, Cohere, Hugging Face, Cloudflare, Perplexity,
  Together, Groq, Stability.
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
has nothing new.

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

Body, in this order:

1. `## The short version` — three to five bullets, one per story, each a
   complete sentence with the link inline.
2. `## <Story headline>` — one section per story worth more than a bullet:
   what happened, what is new about it, what it does not yet tell us.
3. `## Worth watching` — optional. Explicitly forward-looking, explicitly
   labelled as such.

Do not pad to fill the structure. A quiet day is three bullets and no sections;
that is a correct brief, not a failed one.

## What does not go in

- Rumours without a named reporter or outlet.
- Funding, valuation or headcount numbers from a source that is itself unsourced.
- Benchmark claims restated as fact when they come from the vendor being
  benchmarked. Attribute them: "on the company's own numbers…".
- Security issues described in enough operational detail to be a recipe. Name
  the class of problem, the affected versions, and the fix.
- Anything about a private individual who is not a public figure acting in a
  public capacity.

## Checks before publishing

- Every link resolves, and points at what the text says it points at.
- Every number in the text appears in a linked source.
- The headline is supported by the body, not by the most exciting bullet in it.
- Nothing in the brief would need a correction if the reader clicked every link.
