---
title: Google previews Gemini 4 Carbon for cyber defenders before general release
date: 2026-10-29 06:03:00 +0900
kind: Daily brief
summary: Google restricts its new cyber-focused frontier model to selected defenders; PyTorch ships 2.15 and GitHub reports more agent-started pull requests.
figures:
  - value: "88.2%"
    label: SEC-bench Pro score Google reports for Gemini 4 Carbon without guardrails
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/
  - value: "more than 40%"
    label: Pull requests started with an agent as of September, according to GitHub's Octoverse report
    url: https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/
sources:
  - title: "Gemini 4 Carbon: our next frontier model"
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/
    outlet: Google
  - title: PyTorch 2.15 Release Blog
    url: https://pytorch.org/blog/pytorch-2-15-release-blog/
    outlet: PyTorch Foundation
  - title: "Octoverse: Commits, pushes, reach new highs in 2026 as developers build with agents"
    url: https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/
    outlet: GitHub
---

## TOP 3

1. [Google announced Gemini 4 Carbon for an initial group of cyber defenders](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/).
2. [The PyTorch Foundation published PyTorch 2.15](https://pytorch.org/blog/pytorch-2-15-release-blog/).
3. [GitHub's Octoverse report measured growing use of agents to initiate pull requests](https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/).

## Models

- **What Google announced:** In its [October 28 Gemini 4 Carbon announcement](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/), Google describes a frontier model focused on sustained engineering tasks and cybersecurity defense. It says access starts this week with a subset of cyber defenders, followed by additional trusted partners through its Fairwind Program; developer, business and consumer availability comes later. Google lists an introductory price of **$2 per million input tokens** and **$10 per million output tokens** for that future launch, followed by **$4** and **$20** after the introductory period.
  - **Evidence and limit:** Google reports **88.2%** on SEC-bench Pro for vulnerability finding, **54.8%** on ExploitGym for exploitation and **71.0%** on CWE-bench for patching, with those external-benchmark evaluations run *without guardrails*. It also reports internal improvements in secure-code generation and fewer unsupported claims relative to Argon. These are Google's reported results, not measurements of the restricted product in a general developer deployment; the announcement does not give a date for general access or an independent evaluation of its live safeguards.

## Agentic AI & Agent Skills

- **Agents in the pull-request workflow:** [GitHub's October 28 Octoverse report](https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/) says developers started **more than 40%** of pull requests with an agent as of September, up from **17%** in March. GitHub also says newly created repositories with an agent configuration file averaged **eight times** as many commits as new repositories without one; that comparison does not by itself establish that agents caused the difference.

## Tools & Open Source

- **PyTorch's new release:** The [PyTorch Foundation's October 28 PyTorch 2.15 announcement](https://pytorch.org/blog/pytorch-2-15-release-blog/) says a rewritten NCCL backend is now the default, with a rollback path; it adds one-sided distributed transports, improves NVFP4 decoding on NVIDIA Blackwell and adds FP8 support on Apple Silicon. Its default wheel moves to CUDA 13.2, while CUDA 13.4 wheels are also available. The release notes mark some platform interfaces as API-unstable.
