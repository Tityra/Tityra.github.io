---
title: vLLM ships structured decisions and serving changes in v0.32.0
date: 2026-10-19 06:03:04 +0900
kind: Daily brief
summary: vLLM adds a structured-decision endpoint, parser support and serving changes; developers also presented Sphinx and pi-cowboy for agent-assisted coding.
figures:
  - value: "43–85%"
    label: More requests per second for short requests with multiple API workers in the PR benchmark cited by vLLM
    url: https://github.com/vllm-project/vllm/releases/tag/v0.32.0
sources:
  - title: vLLM v0.32.0 release
    url: https://github.com/vllm-project/vllm/releases/tag/v0.32.0
    outlet: vLLM / GitHub
  - title: "Show HN: Sphinx – A hook that quizzes you on your AI's code before shipping"
    url: https://news.ycombinator.com/item?id=50137950
    outlet: Hacker News
  - title: Sphinx repository and README
    url: https://github.com/parthh01/sphinx
    outlet: Sphinx / GitHub
  - title: "Show HN: Pi-cowboy – use Codex, Claude Code, OpenCode as subagents"
    url: https://news.ycombinator.com/item?id=50142277
    outlet: Hacker News
  - title: pi-cowboy repository and README
    url: https://github.com/electric-dragon-80000v/pi-cowboy
    outlet: pi-cowboy / GitHub
---

## TOP 3

1. [vLLM released v0.32.0 with a structured-decision endpoint and serving changes](https://github.com/vllm-project/vllm/releases/tag/v0.32.0).
2. [A Show HN submission presented Sphinx's Git-push understanding check for agent-assisted coding](https://news.ycombinator.com/item?id=50137950).
3. [A Show HN submission presented pi-cowboy's coordination of coding subagents in worktrees](https://news.ycombinator.com/item?id=50142277).

## Agentic AI & Agent Skills

- **Coding subagents:** An [October 18 Show HN post](https://news.ycombinator.com/item?id=50142277) presented [pi-cowboy](https://github.com/electric-dragon-80000v/pi-cowboy), an MIT-licensed orchestrator for Pi that runs Pi, Codex, Claude Code or OpenCode subagents in isolated copy-on-write Git worktrees with terminal panes in Herdr. The repository predates the post; the news here is its presentation to developers, not a newly created repository.

## Tools & Open Source

- **What shipped:** The [vLLM v0.32.0 release, published October 18](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), adds `POST /v1/systemone` for structured `choice`, `noul` and `score` decisions and an `hf` tool/reasoning parser that reads a checkpoint's `response_template`. Its serving changes include lower-precision KV-cache options, additional multimodal model support and load-based routing among API workers when more than one is configured.
  - **What operators should check:** The release lists security fixes, a narrower default CORS policy and breaking changes including dropping Python 3.10 and renaming Responses API reasoning-stream events. Its cited **43–85%** short-request throughput improvement with multiple API workers comes from a particular PR benchmark, not a general speed guarantee; the release does not establish the same gain for other models or workloads.
- **Understanding before push:** An [October 18 Show HN post](https://news.ycombinator.com/item?id=50137950) introduced [Sphinx](https://github.com/parthh01/sphinx), a Git hook that pauses protected-branch pushes to ask the developer questions about a committed change. Its README says installation changes the user's global Git hooks path, a reviewer model receives code, and checks can be bypassed; it is practice, not a security gate.
