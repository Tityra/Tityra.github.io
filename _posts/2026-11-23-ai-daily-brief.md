---
title: OpenRouter removes 125 endpoints from zero-retention eligibility after provider incidents
date: 2026-11-23 06:03:43 +0900
kind: Daily brief
summary: OpenRouter removes zero-data-retention eligibility from provider endpoints after security findings; llama.cpp fixes a CDNA3 scale error, and an agent-themed game reaches Show HN.
figures:
  - value: "125"
    label: Endpoints removed from Zero Data Retention eligibility, according to OpenRouter
    url: https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/
  - value: "3"
    label: Providers off-boarded after OpenRouter's investigations, according to OpenRouter
    url: https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/
sources:
  - title: Data Processing Incidents on Inference Providers
    url: https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/
    outlet: OpenRouter
  - title: Release b12632
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12632
    outlet: llama.cpp / GitHub
  - title: "HIP: fix double halving of NVFP4 scales on CDNA3"
    url: https://github.com/ggml-org/llama.cpp/pull/32790
    outlet: llama.cpp / GitHub
  - title: "Show HN: I built a game where you are an LLM's subagent"
    url: https://news.ycombinator.com/item?id=50599762
    outlet: Hacker News
  - title: Worker 755 repository and README
    url: https://github.com/gulivan/worker755
    outlet: gulivan / GitHub
---

## TOP 3

1. [OpenRouter restricted zero-data-retention routing](https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/) after investigations of inference providers.
2. [llama.cpp corrected a CDNA3 NVFP4 scale error](https://github.com/ggml-org/llama.cpp/releases/tag/b12632).
3. [A developer brought an AI-manager game to Show HN](https://news.ycombinator.com/item?id=50599762).

## Tools & Open Source

- **Provider data-handling response:** In its [November 22 notice](https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/), OpenRouter says researchers found compromised data or evidence that some inference providers were not upholding their data policies. OpenRouter says it off-boarded **three providers**, removed **125 endpoints** from Zero Data Retention eligibility—including precautionary removals—and notified potentially affected customers. It says the findings did **not** show a breach or unauthorized access of OpenRouter itself; that distinction does not clear the providers under review.
  - **What remains open:** OpenRouter says it is testing network paths for third-party forwarding and requiring validation before restoring eligibility. Its notice links several provider statements but says not all affected providers have posted publicly; it does not quantify affected customer requests or provide a complete public provider-by-provider account.
- **CDNA3 scale correction:** The [November 22 llama.cpp b12632 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12632) includes a HIP fix for double-halved NVFP4 scales; the [merged change](https://github.com/ggml-org/llama.cpp/pull/32790) says removing a redundant division corrects gfx942 output. It reports a correctness change, not a measured performance improvement.

## Community

- **Show HN, agent roles reversed:** In a [November 22 Show HN submission](https://news.ycombinator.com/item?id=50599762), a maker presented [Worker 755](https://github.com/gulivan/worker755), a browser game in which an LLM manager assigns timed tasks to a human playing its subagent. The repository describes the game and its local-run instructions; this is a project presentation, not evidence about real-world agent reliability.
