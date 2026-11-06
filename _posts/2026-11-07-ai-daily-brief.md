---
title: Harness adapters train agents inside their own tool environments
date: 2026-11-07 06:03:59 +0900
kind: Daily brief
summary: Harness-specific RL adapters pair with tool-call checks; ToyBlocks opens a controlled robotics testbed, while agent identity and local-inference tools advance.
figures:
  - value: "270"
    label: Repo2RLEnvs tasks in the harness-hub authors' training and evaluation pool
    url: https://huggingface.co/blog/harness-hub/harness-adapters
  - value: "up to 24×"
    label: Real-time simulation speed reported by Ai2 for ToyBlocks data generation
    url: https://huggingface.co/blog/allenai/toyblocks
sources:
  - title: "Harness adapters: Safe RL for efficient agentic development"
    url: https://huggingface.co/blog/harness-hub/harness-adapters
    outlet: harness-hub / Hugging Face
  - title: "ToyBlocks: A controlled world for robot learning and evaluation"
    url: https://huggingface.co/blog/allenai/toyblocks
    outlet: Ai2 / Hugging Face
  - title: "Show HN: Agentic Identity Broker, OAuth Delegation for AI Agents"
    url: https://news.ycombinator.com/item?id=50393235
    outlet: Hacker News
  - title: Agentic Identity Broker repository and README
    url: https://github.com/zalando-incubator/agentic-identity-broker
    outlet: Zalando Engineering / GitHub
  - title: Egyptian and Nigerian English join the Open ASR Leaderboard
    url: https://huggingface.co/blog/open-asr-leaderboard-liva
    outlet: Hugging Face
  - title: llama.cpp release b12179
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12179
    outlet: ggml-org / GitHub
---

## TOP 3

1. [Harness-hub released an RL recipe for adapters trained inside individual agent harnesses](https://huggingface.co/blog/harness-hub/harness-adapters).
2. [Ai2 introduced ToyBlocks as a controlled robotics training and evaluation environment](https://huggingface.co/blog/allenai/toyblocks).
3. [Zalando Engineering presented an agent identity broker on Show HN](https://news.ycombinator.com/item?id=50393235).

## Agentic AI & Agent Skills

- **Train the model where its agent actually works:** In its [November 6 report](https://huggingface.co/blog/harness-hub/harness-adapters), harness-hub describes a separate LoRA adapter per model and agent harness, trained by reinforcement learning on verifiable tasks inside unmodified pi, OpenCode and Hermes sessions. Its Repo2RLEnvs pipeline turns shared agent trajectories into repair, question-answering, build and extension tasks; **230 of 270** such tasks enter training and **40** are held out. A single serving process can host the base model and several adapters, rather than serving a separate full model for each harness.
  - **The boundary on the claim:** The authors route model responses through their rule-based safeagents proxy before tool calls reach the harness, blocking detected reward-hacking shortcuts and scoring those attempts zero. They report fewer tool calls with maintained or improved accuracy in early held-out smoke tests, while the final runs and their checkpoint evaluations are still streaming. Those preliminary tests do not establish general gains across other models, harnesses or production tasks, and rule-based checks are not proof that every shortcut is caught.

## MCP & Plug-in

- **Delegated credentials for agent tools:** A [November 6 Show HN submission](https://news.ycombinator.com/item?id=50393235) points to Zalando Engineering's [Agentic Identity Broker](https://github.com/zalando-incubator/agentic-identity-broker), which describes agent registration, OAuth delegation and user consent, with centralized approval and audit controls for tool calls. The project says it is used internally for some MCP servers and remains in active development; that is its own deployment account, not an independent security assessment.

## Tools & Open Source

- **A robot-learning testbed with controllable tasks:** In its [November 6 ToyBlocks report](https://huggingface.co/blog/allenai/toyblocks), Ai2 introduces a tabletop robot-arm simulation that generates task plans and demonstrations, then tests models on held-out block manipulations. Ai2 reports parallel demonstration generation at **up to 24 times real-time** on a GPU; the constrained world is a research testbed, not evidence that a policy trained there generalizes to unrestricted physical settings.
- **More accents in speech evaluation:** [Hugging Face's November 6 update](https://huggingface.co/blog/open-asr-leaderboard-liva) adds private conversational Egyptian and Nigerian English splits to its Open ASR Leaderboard and expands the private-tab accent breakdown; the change adds evaluation data, not a new speech model.
- **Local inference update:** The [November 6 llama.cpp b12179 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12179) adds a Hexagon backend path for three-dimensional convolution through its tiled convolution implementation, alongside related stride and kernel fixes.
