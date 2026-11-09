---
title: Anthropic releases Claude Fable 5.2 and Mythos 5.2 with distinct safeguards
date: 2026-11-10 06:03:40 +0900
kind: Daily brief
summary: Anthropic upgrades its guarded and verified-access frontier models; Meta introduces the smaller Muse Ember, while Flide and HOPE address inference and expert-pruning costs.
figures:
  - value: "49.1%"
    label: Anthropic's own FrontierCode 2.0 result for Fable 5.2 at Xhigh effort
    url: https://www.anthropic.com/claude-fable-and-mythos-5-2
  - value: "1M"
    label: Muse Ember context-window tokens stated by Meta
    url: https://research.meta.ai/blog/muse-ember
  - value: "up to 9.5×"
    label: Flide authors' reported inference speedup against vLLM and SGLang
    url: https://github.com/OmniJev/Flide
sources:
  - title: Introducing Claude Fable 5.2 and Claude Mythos 5.2
    url: https://www.anthropic.com/claude-fable-and-mythos-5-2
    outlet: Anthropic
  - title: "Introducing Our Smallest, Most Efficient Model: Muse Ember"
    url: https://research.meta.ai/blog/muse-ember
    outlet: Meta AI Research
  - title: Flide repository and README
    url: https://github.com/OmniJev/Flide
    outlet: OmniJev / GitHub
  - title: "Show HN: Flide: Make Jev-like decision models up to 9.5x faster"
    url: https://news.ycombinator.com/item?id=50421155
    outlet: Hacker News
  - title: Hacker News discussion of Claude Fable 5.2 and Mythos 5.2
    url: https://news.ycombinator.com/item?id=50429906
    outlet: Hacker News
  - title: "Your Experts Have Partners. There's HOPE for Keeping Them Together"
    url: https://huggingface.co/blog/amazon/higher-order-pruning-experts
    outlet: Amazon / Hugging Face
  - title: "Nemotron-Personas-Finance-Japan: A Synthetic Dataset Capturing Japan's Demographics and Financial Context"
    url: https://huggingface.co/blog/nvidia/nemotron-personas-finance-japan
    outlet: NVIDIA / Hugging Face
---

## TOP 3

1. [Anthropic introduced Claude Fable 5.2 and a verified-access Mythos 5.2](https://www.anthropic.com/claude-fable-and-mythos-5-2).
2. [Meta launched its smaller Muse Ember model](https://research.meta.ai/blog/muse-ember).
3. [Flide's authors presented their decision-model inference engine to developers](https://news.ycombinator.com/item?id=50421155).

## Models

- **One underlying model, two access paths:** In its [November 9 announcement](https://www.anthropic.com/claude-fable-and-mythos-5-2), Anthropic says Claude Fable 5.2 and Mythos 5.2 share a base model but differ in cybersecurity and biology safeguards: Fable is generally available, while eligible cybersecurity and life-sciences organizations can apply for Mythos access through verification programs. Both are priced at **$8 per million input tokens and $40 per million output tokens** on the Claude Platform; an optional fast mode has different pricing. Anthropic reports up to **30%** faster output than the preceding versions and **49.1%** on its FrontierCode 2.0 coding evaluation at Xhigh effort.
  - **What the announcement does not establish:** Those speed and benchmark results are Anthropic's prerelease measurements, not independent guarantees for a developer's workload; its benchmark table mixes effort levels and, for some competitors, different harnesses or safeguards. Mythos availability is conditional rather than a general public launch. Anthropic recommends Opus 5.5 as the starting point for most routine coding and knowledge work, reserving Fable or Mythos for more demanding tasks.
- **A small model for repeated agent subtasks:** Meta's [November 9 Muse Ember announcement](https://research.meta.ai/blog/muse-ember) says the model is available as `muse-ember-1.0` on Muse Code and Meta Model API with a **1M-token context window**. Meta lists **$0.10 per million input tokens** and **$0.50 per million output tokens**; its cost-per-task comparisons use proposed pricing and its other evaluations include internal tests, so those comparisons are vendor claims.

## Tools & Open Source

- **Decision inference with shared state:** In its [November 9 Show HN presentation](https://news.ycombinator.com/item?id=50421155), the Flide team linked its [open-source engine](https://github.com/OmniJev/Flide), which forks a processed input state to answer multiple independent questions. The authors report **up to 9.5×** speedup against vLLM and SGLang under their tested workloads; the README also records November 9 model-support and API updates. That ceiling is not a benchmark for every model or request pattern.
- **Prune experts together, not independently:** Amazon's [November 9 HOPE write-up](https://huggingface.co/blog/amazon/higher-order-pruning-experts) describes a Mixture-of-Experts pruning method that accounts for pairwise expert interactions. In the authors' tests at **50%** pruning, it had a better average rank than the first-order baselines; this is a research and code release, not a new base model.
- **Synthetic financial personas for Japan:** [NVIDIA's November 9 release note](https://huggingface.co/blog/nvidia/nemotron-personas-finance-japan) describes a CC BY 4.0 synthetic dataset with **9 million personas** across **1 million records**, intended for financial-agent simulation and evaluation. The privacy and representativeness descriptions are the authors' account, not an independent audit.

## Community

- **Discussion, not evidence of a product change:** In the [November 9 Hacker News thread](https://news.ycombinator.com/item?id=50429906), developers disputed claims of a recent decline in Claude Opus quality. One commenter described a small rerun of coding tasks that did not show such a regression; others reported different experiences. Neither participant reports nor this thread establish that Anthropic changed model behavior.
