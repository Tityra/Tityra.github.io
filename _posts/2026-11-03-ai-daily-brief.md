---
title: Researchers report direct edits to model weights that correct Qwen's reasoning loops
date: 2026-11-03 06:03:21 +0900
kind: Daily brief
summary: A weight-space experiment reports a targeted Qwen repair; an agent database guard and silent-speech glasses also surfaced.
figures:
  - value: "48.1%"
    label: MATH-500 score after the Qwen weight edit in Takehi and colleagues' experiment
    url: https://rikiyat.github.io/blog/weight-space-programming/
  - value: "0.016%"
    label: Share of Qwen3.5-0.8B weights edited in Takehi and colleagues' experiment
    url: https://rikiyat.github.io/blog/weight-space-programming/
sources:
  - title: "Sparks of Weight-Space Programming: LLMs can natively read & write neural network weights"
    url: https://rikiyat.github.io/blog/weight-space-programming/
    outlet: Rikiya Takehi and colleagues
  - title: Logs of the weight-space experiments
    url: https://github.com/RikiyaT/lm_understand-logs
    outlet: RikiyaT / GitHub
  - title: Deedglass repository and README
    url: https://github.com/deedglass/deedglass
    outlet: deedglass / GitHub
  - title: "Show HN: Deedglass – An agent said it updated 1 row; Postgres changed 301"
    url: https://news.ycombinator.com/item?id=50337736
    outlet: Hacker News
  - title: "Show HN: Subvocal – Talk to your computer without making noise"
    url: https://news.ycombinator.com/item?id=50340088
    outlet: The Subvocal Company / Hacker News
  - title: Astra can read and write weights to improve Qwen — discussion
    url: https://news.ycombinator.com/item?id=50341174
    outlet: Hacker News
---

## TOP 3

1. [Researchers reported a direct weight edit that corrected a Qwen reasoning loop](https://rikiyat.github.io/blog/weight-space-programming/).
2. [Deedglass was presented as a guard for agent-driven database changes](https://news.ycombinator.com/item?id=50337736).
3. [Subvocal's founders demonstrated silent-speech input through sensing glasses](https://news.ycombinator.com/item?id=50340088).

## Models

- **A targeted repair, not new mathematical knowledge:** In their [November 2 weight-space report](https://rikiyat.github.io/blog/weight-space-programming/), Rikiya Takehi and colleagues describe using GPT-6 Astra to inspect and edit Qwen3.5-0.8B weights without gradient training. They attribute an output-loop problem to a small set of weights and report that changing **0.016%** of them raised MATH-500 accuracy from **7.9% to 48.1%** under the same sampling settings. Their [released experiment logs](https://github.com/RikiyaT/lm_understand-logs) contain prompts, code and evaluation records; the edits are reported by the authors, not independently benchmarked here.
  - **What the result does not establish:** The authors' separate attempt to improve Gemma 3 270M, which did not have the same loop problem, produced no comparable gain. Their evidence concerns specific models and tasks; it does not show that direct edits can add an ability a model lacks or replace post-training generally.

## Agentic AI & Agent Skills

- **Check the effect, not only the agent's account:** In a [November 2 Show HN submission](https://news.ycombinator.com/item?id=50337736), the [Deedglass project](https://github.com/deedglass/deedglass) presents a self-hosted layer that applies rules to agent tool calls, compares reported database changes with observed changes and signs an audit record. Its one-row-versus-many-rows scenario is a project demonstration, not an independently measured failure rate.

## Tools & Open Source

- **Silent input prototype:** In their [November 2 Show HN account](https://news.ycombinator.com/item?id=50340088), Subvocal's founders say their glasses sense radio-frequency changes from silent mouth movements and decode them to text with a model. They describe a prototype and calibration process, not a generally available product or an independently verified accuracy study.

## Community

- **Discussion of the weight-edit claim:** In the [November 2 Hacker News thread](https://news.ycombinator.com/item?id=50341174), commenters dispute whether the Qwen result is best read as learning new math or removing an existing generation loop. That distinction is a discussion of the authors' interpretation, not a separate benchmark.
