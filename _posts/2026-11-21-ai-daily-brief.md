---
title: Hugging Face trains agent-specific adapters for coding harnesses
date: 2026-11-21 06:03:30 +0900
kind: Daily brief
summary: Hugging Face shares a reproducible RL recipe for harness-specific coding adapters; Thinking Machines releases Inkling 2 Mini, and OpenComputer presents its self-hostable coding agent.
figures:
  - value: "55%"
    label: Terminal-Bench 2.1 pass@1 for Hugging Face's pi-harness adapter, in its own evaluation
    url: https://huggingface.co/blog/harness-adapters-at-scale
  - value: "3B"
    label: Active parameters per token in Inkling 2 Mini, according to Hugging Face
    url: https://huggingface.co/blog/inkling2mini
sources:
  - title: "Introducing harness adapters: adapt your favorite model to your harness to improve performance and cost"
    url: https://huggingface.co/blog/harness-adapters-at-scale
    outlet: Hugging Face
  - title: Welcome Inkling 2 Mini, Cutting-edge Performance for your Local Setup
    url: https://huggingface.co/blog/inkling2mini
    outlet: Hugging Face
  - title: Inkling 2 Mini model card
    url: https://huggingface.co/thinkingmachines/Inkling-2-Mini
    outlet: Thinking Machines Lab / Hugging Face
  - title: "Show HN: OpenComputer – an open source alternative to Devin"
    url: https://news.ycombinator.com/item?id=50581403
    outlet: OpenComputer / Hacker News
  - title: OpenComputer repository and README
    url: https://github.com/diggerhq/opencomputer
    outlet: OpenComputer / GitHub
---

## TOP 3

1. [Hugging Face published a recipe for training adapters inside coding-agent harnesses](https://huggingface.co/blog/harness-adapters-at-scale).
2. [Thinking Machines released Inkling 2 Mini](https://huggingface.co/thinkingmachines/Inkling-2-Mini), an open multimodal model aimed at local inference.
3. [OpenComputer's makers presented their self-hostable coding agent](https://news.ycombinator.com/item?id=50581403) to developers.

## Models

- **A smaller Inkling for local setups:** In its [November 20 write-up](https://huggingface.co/blog/inkling2mini), Hugging Face describes Thinking Machines Lab's [Apache-licensed Inkling 2 Mini release](https://huggingface.co/thinkingmachines/Inkling-2-Mini): a text-and-image-input, text-output mixture-of-experts model with about **26B total and 3B active parameters per token**, a stated **1M-token context**, and looped middle layers. The model card lists a mixed-precision checkpoint of about **20GB**; Hugging Face calls its own early comparisons “vibe tests,” not a controlled independent benchmark.

## Agentic AI & Agent Skills

- **Train the model in the harness it will use:** In its [November 20 report](https://huggingface.co/blog/harness-adapters-at-scale), Hugging Face describes reinforcement-learning LoRA adapters for Qwen3.8-27B, trained separately inside pi, OpenCode and Hermes Agent on coding tasks. It provides a recipe using TRL, OpenEnv and Harbor, plus adapters, task data and a merged “super adapter” intended to run across the three harnesses. This is an adaptation of one base model to particular tools and task distributions, not a general model release.
  - **What the team's tests show—and do not:** In Hugging Face's pi-harness Terminal-Bench 2.1 setup, its stated pass@1 rises from **39% to 55%**, while average generated tokens per task fall from **2.9K to 1.5K**. The report says each harness-specific adapter improves on the base under its own harness; it does not establish the same gains for other models, tasks or deployment settings, and these remain the authors' evaluations rather than independent replication.

## Tools & Open Source

- **A coding agent teams can host:** In a [November 20 Show HN presentation](https://news.ycombinator.com/item?id=50581403), an OpenComputer founder described running the agent harness and sandbox together on a durable VM, with sessions isolated in Git worktrees and backed up for resumption. The [Apache-licensed repository](https://github.com/diggerhq/opencomputer) describes Slack-driven tasks that end in pull requests and a self-hosting option; the founder's speed and cost comparisons are its own, not independently verified here.
