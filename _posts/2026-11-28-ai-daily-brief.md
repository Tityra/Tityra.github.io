---
title: Hugging Face engineers demonstrate LTX-2.5 video generation on Trainium3
date: 2026-11-28 06:05:01 +0900
kind: Daily brief
summary: A Trainium3 video-generation experiment leads; llama.cpp adds trace sharing, a code-flow tool seeks early users, and developers debate an agent skill's handling of project ideas.
figures:
  - value: "22–23 s"
    label: Time for a 10-second clip with sound after model loading in the authors' half-instance Trainium3 setup
    url: https://huggingface.co/blog/video-trainium3
sources:
  - title: "Taking Trainium3 to the Track: Generating Videos with LTX-2.5"
    url: https://huggingface.co/blog/video-trainium3
    outlet: Hugging Face
  - title: Release b12811
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12811
    outlet: llama.cpp / GitHub
  - title: "Show HN: Flowmaps – the logic layer for agents and developers"
    url: https://news.ycombinator.com/item?id=50669993
    outlet: Flowmaps founder / Hacker News
  - title: Flowmaps — The Logic Layer for Agents and Developers
    url: https://flowmaps.ai/
    outlet: Flowmaps
  - title: Your AI agents can now call you
    url: https://onair.io/blog/agents-can-call
    outlet: OnAir
  - title: Convex skills send the user's app idea to a remote server without telling them
    url: https://news.ycombinator.com/item?id=50669765
    outlet: Hacker News
  - title: Quickstart skills send the user's idea to a convex.site host and run remote scripts, written to avoid safety checks
    url: https://github.com/convex/convex-backend-skill/issues/64
    outlet: Convex GitHub issue
---

## TOP 3

1. [Hugging Face engineers described running LTX-2.5 video generation on Trainium3](https://huggingface.co/blog/video-trainium3), including the changes needed to make short films from linked shots.
2. [llama.cpp added conversation-to-dataset trace sharing](https://github.com/ggml-org/llama.cpp/releases/tag/b12811) in a new prerelease.
3. [Developers debated a Convex agent skill's treatment of project ideas](https://news.ycombinator.com/item?id=50669765) and received a response from the company's CEO.

## Agentic AI & Agent Skills

- **Code flows for agents:** In a [November 27 Show HN introduction](https://news.ycombinator.com/item?id=50669993), Flowmaps' builder sought early users for a service that [describes](https://flowmaps.ai/) mapping code paths and exposing them to agents through MCP. These are the maker's product claims, not independently tested coverage of a codebase.

## Tools & Open Source

- **Video generation on Trainium3:** In their [November 27 technical account](https://huggingface.co/blog/video-trainium3), Hugging Face engineers describe adapting LTX-2.5's diffusers pipelines to run on AWS Trainium3, splitting the transformer and video sequence across NeuronCores and reducing host-side bottlenecks. They assemble a short film from shots that start or end on frames of other shots, so a subject can continue across a cut; the film layer orders those dependencies and handles trimming, captions and sound levels. On their half-`trn3.48xlarge` setup, a **10-second, 2048×1024 clip with sound took 22–23 seconds** once models were loaded.
  - **The limits of that result:** The authors say model loading took about three minutes, initial generation took longer, and their work does not provide a directly comparable CUDA test. They report that details still need multiple takes and sound does not carry continuously between shots. The timing is their particular configured workload, not a general accelerator ranking or a new LTX model release.
- **Trace sharing in local inference:** The [November 27 llama.cpp b12811 prerelease](https://github.com/ggml-org/llama.cpp/releases/tag/b12811) adds UI actions to upload a whole conversation or a branch as a JSONL trace to a Hugging Face dataset. The release notes say distributed builds include it, while a UI built from source needs an explicit option; users choose a dataset and whether a newly created one is private.
- **Calling a user from an agent:** In its [November 27 announcement](https://onair.io/blog/agents-can-call), OnAir says an agent can read a user-specific Markdown page and use `curl` to start, speak on, listen to and end a call, with the service bridging text and voice. This is the provider's description of its integration, not a tested reliability or privacy assessment.

## Community

- **Discussion — agent-skill disclosure:** A [November 27 Hacker News thread](https://news.ycombinator.com/item?id=50669765) revisited an [older Convex GitHub issue](https://github.com/convex/convex-backend-skill/issues/64) about a quickstart skill sending a project idea to a hosted service and instructions around remote scripts. A commenter identifying himself as Convex's CEO said the prompt upload is intentional for quickstart, claimed it is discarded within 30 seconds, and promised to review transparency; the thread does not independently verify retention or settle the safety concerns.
