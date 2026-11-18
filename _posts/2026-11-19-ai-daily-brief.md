---
title: RadixArk releases DaisyRose-27B for long-horizon agent tasks
date: 2026-11-19 06:05:03 +0900
kind: Daily brief
summary: RadixArk releases an open model post-trained on agent tasks; Mastra presents its software factory, Reson8 details a compact speech model, and an experimental MoE offload path surfaces.
figures:
  - value: "12.0%"
    label: Terminal Bench 4.1 pass@1 for DaisyRose-27B in RadixArk's own evaluation
    url: https://huggingface.co/blog/RadixArk/daisyrose-27b-pushing-the-frontier-of-post-trainin
  - value: "0.5B"
    label: Parameters in Reson8's Rumble-2-Flash speech model, according to Reson8
    url: https://huggingface.co/blog/rumble-2-flash
sources:
  - title: "DaisyRose-27B: Pushing the Frontier of Post-Training Efficiency"
    url: https://huggingface.co/blog/RadixArk/daisyrose-27b-pushing-the-frontier-of-post-trainin
    outlet: RadixArk / Hugging Face
  - title: DaisyRose-27B model and model card
    url: https://huggingface.co/RadixArk/DaisyRose-27B
    outlet: RadixArk / Hugging Face
  - title: "Show HN: Mastra Factory, the open-source software factory we use to build Mastra"
    url: https://news.ycombinator.com/item?id=50548660
    outlet: Mastra / Hacker News
  - title: Mastra Factory documentation
    url: https://factory.mastra.ai/
    outlet: Mastra
  - title: "Rumble-2-Flash: an open 0.5B speech model for 40+ languages"
    url: https://huggingface.co/blog/rumble-2-flash
    outlet: Reson8 / Hugging Face
  - title: "180B Parameters, 32GB of RAM: Pushing MoE Inference to the Limit with Transformers"
    url: https://huggingface.co/blog/moe-expert-streaming
    outlet: Tarek Ziadé / Hugging Face
---

## TOP 3

1. [RadixArk released DaisyRose-27B](https://huggingface.co/blog/RadixArk/daisyrose-27b-pushing-the-frontier-of-post-trainin), a post-trained open model aimed at long agent tasks.
2. [Mastra presented Factory](https://news.ycombinator.com/item?id=50548660), its open-source environment for agent-driven software work.
3. [Reson8 introduced Rumble-2-Flash](https://huggingface.co/blog/rumble-2-flash), a compact multilingual speech-recognition model.

## Models

- **An agent-task post-training release:** In its [November 18 announcement](https://huggingface.co/blog/RadixArk/daisyrose-27b-pushing-the-frontier-of-post-trainin), RadixArk released [Apache-licensed DaisyRose-27B weights](https://huggingface.co/RadixArk/DaisyRose-27B), built on Qwen3.8-27B. The company says it trained with reinforcement learning on about **1,200 curated, multi-step tasks**, using sandboxes in which the agent executed tools and received a grade. It offers BF16, FP8 and NVFP4 checkpoints and retains the base model's image understanding and **256K-token context window**; the reported longer training sessions used harness summarization, not a larger native context window.
  - **What the result establishes—and does not:** RadixArk reports **12.0% pass@1 on Terminal Bench 4.1**, versus **5.6%** for the base model, using the better of its BF16 and FP8 runs for each benchmark. Those are the developer's evaluation numbers, not an independent test or evidence that a reader's agent will gain the same reliability. The announcement describes a task-selection, training and sandbox pipeline, but does not establish how much each component individually contributed to the benchmark gain.
- **A small speech model:** [Reson8's November 18 release write-up](https://huggingface.co/blog/rumble-2-flash) describes the Apache-licensed **0.5B-parameter Rumble-2-Flash** for automatic speech recognition in **40+ languages**, with Transformers and vLLM support. Its reported error rates and throughput come from the team's stated evaluation setups, not a general guarantee for noisy audio or other hardware.

## Agentic AI & Agent Skills

- **A configurable software factory:** In a [November 18 Show HN presentation](https://news.ycombinator.com/item?id=50548660), Mastra introduced Factory for moving issues through plans, implementations and reviewed pull requests. The [documentation](https://factory.mastra.ai/) describes team-defined stages, approvals, and a locally run server with either platform services or self-hosted components; the maker's reported production PR volume is its own experience, not a measured result for adopters.

## Tools & Open Source

- **Experimental SSD-backed expert streaming:** In a [November 18 technical write-up](https://huggingface.co/blog/moe-expert-streaming), Tarek Ziadé describes loading selected MoE experts from disk into a bounded cache for Transformers, and testing a large Qwen model on a memory-limited Mac. The proposed `experts_offload` API is still under discussion in a Transformers pull request; the article's throughput comparisons are local tests, not a released Transformers feature or universal speed claim.
