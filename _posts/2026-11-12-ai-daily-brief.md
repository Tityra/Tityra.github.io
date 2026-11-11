---
title: Google launches a multimodal Decisions API and Gemini Decision 1
date: 2026-11-12 06:03:59 +0900
kind: Daily brief
summary: Google's new closed-set decision endpoint leads; llm fixes credential-routing bugs, and Klad lets coding agents paint editable strokes.
figures:
  - value: "1,000"
    label: Maximum independent questions per request stated by Google for its Decisions API
    url: https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/
  - value: "$0.10"
    label: Google's stated Gemini Decision 1 price per million input tokens
    url: https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/
  - value: "150–250 ms"
    label: Google's reported end-to-end latency for Gemini Decision 1 on its tested workloads
    url: https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/
sources:
  - title: "Gemini Decisions API: Fast, calibrated multimodal decisions"
    url: https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/
    outlet: Google
  - title: Release 0.37.2
    url: https://github.com/simonw/llm/releases/tag/0.37.2
    outlet: Simon Willison / GitHub
  - title: "Show HN: Klad, a paint app your coding agent can drive (source-available)"
    url: https://news.ycombinator.com/item?id=50454951
    outlet: Hacker News
  - title: Klad repository and README
    url: https://github.com/klad-app/klad
    outlet: Klad / GitHub
  - title: Hacker News discussion of Gemini Decisions API
    url: https://news.ycombinator.com/item?id=50456791
    outlet: Hacker News
---

## TOP 3

1. [Google introduced a new API for bounded multimodal decisions](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/).
2. [The llm CLI patched paths that could send an OpenAI key to another provider](https://github.com/simonw/llm/releases/tag/0.37.2).
3. [Klad's maker presented a painting app controlled by coding agents](https://news.ycombinator.com/item?id=50454951).

## Models

- **A distinct decision endpoint, not merely wider access to a general-purpose model:** In its [November 11 announcement, “Gemini Decisions API: Fast, calibrated multimodal decisions”](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/), Google introduced Gemini Decision 1 (`gemini-decision-1`) and an API for closed-set yes/no, multiple-choice and rubric-scoring tasks. One shared input can contain text, images, audio, video or PDFs, with **up to 1,000 independent questions** in a request; the endpoint returns option probabilities rather than generating answer text token by token. Google lists **$0.10 per million input tokens**, no output-token charge and a no-cost prototyping tier in AI Studio. It describes uses including tool selection, model routing and policy checks, with its own tests reporting **150–250 ms end-to-end latency**.
  - **The boundary of the claim:** Google's latency and relative cost or calibration comparisons come from its announced tests, including a shorter-context benchmark than the API's stated maximum; they are not independent measurements across every modality and input size. Google says integrations are rolling out and Google Cloud support is coming soon, rather than claiming both are already generally available.

## Tools & Open Source

- **Credential-routing fixes in llm:** [Simon Willison's November 11 release notes for llm 0.37.2](https://github.com/simonw/llm/releases/tag/0.37.2) say two configuration paths could send a stored or environment-provided OpenAI API key to a different OpenAI-compatible endpoint; the release changes those paths to avoid forwarding the key, including when a named endpoint key is missing or a Responses-configured model is forced into chat-completions mode.
- **Editable art made by an agent:** In a [November 11 Show HN presentation](https://news.ycombinator.com/item?id=50454951), Klad's maker shared a [source-available painting and animation app](https://github.com/klad-app/klad) in which an agent uses a CLI while a person can inspect and edit individual strokes in the same drawing. The README calls this an early, self-build release and distinguishes its source-available licence from open source; its drawing workflow is not an image-model release.

## Community

- **Discussion, not a benchmark:** In the [November 11 Hacker News thread about the Decisions API](https://news.ycombinator.com/item?id=50456791), developers debated whether ordinary language-model token probabilities suffice for calibrated yes/no decisions and asked about availability outside AI Studio. Those comments raise implementation and distribution questions, not independent evidence for the announcement's performance claims.
