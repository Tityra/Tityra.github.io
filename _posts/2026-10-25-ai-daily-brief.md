---
title: Microsoft open-sources Agensh, a decentralized multi-agent harness
date: 2026-10-25 06:02:32 +0900
kind: Daily brief
summary: Microsoft releases the Agensh multi-agent harness and its reproduction guide; llama.cpp changes Snapdragon attention scheduling, and mathematicians open a revision hub for OpenAI's math write-ups.
figures:
  - value: "1,024"
    label: Agents in Microsoft's largest reported Agensh Pandoc experiment
    url: https://github.com/microsoft/Agensh
  - value: "28.78%"
    label: Mean final test-pass rate Microsoft reports with 128 agents on five ProgramBench tasks
    url: https://github.com/microsoft/Agensh
sources:
  - title: "Agensh: A Decentralized, Scalable Multiagent Harness"
    url: https://github.com/microsoft/Agensh
    outlet: Microsoft / GitHub
  - title: "Show HN: Agensh – A Decentralized, Scalable Multiagent Harness"
    url: https://news.ycombinator.com/item?id=50223759
    outlet: Hacker News
  - title: llama.cpp b11868 release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11868
    outlet: ggml-org / GitHub
  - title: "oai-math-revised: a community hub for revising OpenAI’s math write-ups"
    url: https://terrytao.wordpress.com/2026/10/24/oai-math-revised-a-community-hub-for-revising-openais-math-write-ups/
    outlet: Terence Tao's blog
---

## TOP 3

1. [Microsoft opened the Agensh multi-agent harness and a reproduction guide](https://github.com/microsoft/Agensh).
2. [llama.cpp changed how its Hexagon attention work is distributed across cores](https://github.com/ggml-org/llama.cpp/releases/tag/b11868).
3. [A mathematics community project opened a revision hub for OpenAI's math write-ups](https://terrytao.wordpress.com/2026/10/24/oai-math-revised-a-community-hub-for-revising-openais-math-write-ups/).

## Agentic AI & Agent Skills

- **What opened:** The [Microsoft Agensh repository](https://github.com/microsoft/Agensh) says its harness, experiment scripts and reproduction guide were open-sourced on October 24; a [Show HN submission later that day](https://news.ycombinator.com/item?id=50223759) corroborates its public presentation, not the repository's original creation. Agensh lets agents claim subtasks, share findings and merge work asynchronously without a central task orchestrator. Its published single-node setup uses Docker Compose, Gitea for the shared workspace and Mattermost for messages, layered on a Copilot agent loop.
  - **What the evidence covers:** On five selected ProgramBench tasks under a six-hour, no-internet evaluation, Microsoft reports mean final test-pass rates of **19.31% with one agent** and **28.78% with 128 agents** using GPT-5.6-sol. It also reports a Pandoc run with **1,024 agents**, but that is a different, single-task experiment; the repository does not establish comparable gains across arbitrary tasks or deployments. These are the project's own evaluations, not independent results.

## Tools & Open Source

- **Snapdragon inference:** The [llama.cpp b11868 release, published October 25 in Korea](https://github.com/ggml-org/llama.cpp/releases/tag/b11868), adds a KV-head team split for multicore Hexagon HMX flash attention when there are fewer KV heads than cores; its notes give Gemma 4 with two KV heads on four cores as an example. The notes describe scheduling, not a measured speedup.

## Community

- **Mathematical review:** A [guest post by Abhinav Nellore, Johannes Schmitt, Soledad Villar and Rachel Ward on Terence Tao's blog, October 24](https://terrytao.wordpress.com/2026/10/24/oai-math-revised-a-community-hub-for-revising-openais-math-write-ups/), invites contributors to revise OpenAI's math write-ups, which the authors say can be hard to understand and incompletely cited. This is a community editing effort, not a finding that every original write-up is wrong.
