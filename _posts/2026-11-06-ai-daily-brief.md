---
title: Mistral Studio adds managed agents, workflows and hosted apps
date: 2026-11-06 06:06:21 +0900
kind: Daily brief
summary: Mistral expands Studio's agent deployment controls; Rivet launches its actor-based agent orchestrator and Stroq presents local agent-session audits.
figures:
  - value: "35 hours a week"
    label: Time Mistral says its own product-operations workflow saves its team
    url: https://mistral.ai/news/build-with-studio/
  - value: "72 KB"
    label: Baseline memory per actor in Rivet's own comparison
    url: https://github.com/rivet-dev/rivet
sources:
  - title: Build Enterprise Agents, Workflows & Apps in Mistral Studio
    url: https://mistral.ai/news/build-with-studio/
    outlet: Mistral AI
  - title: Mistral Studio adds managed agents, workflows and apps
    url: https://news.ycombinator.com/item?id=50380719
    outlet: Hacker News
  - title: Rivet agent-orchestration repository and README
    url: https://github.com/rivet-dev/rivet
    outlet: Rivet / GitHub
  - title: "Launch HN: Rivet — Scale and Orchestrate Agents on S3"
    url: https://news.ycombinator.com/item?id=50381687
    outlet: Hacker News
  - title: Stroq agent-session audit and hooks repository
    url: https://github.com/AGGIB/Stroq
    outlet: Stroq / GitHub
  - title: "Show HN: Stroq — a local audit of what your coding agent did and why"
    url: https://news.ycombinator.com/item?id=50380704
    outlet: Hacker News
---

## TOP 3

1. [Mistral expanded Studio with managed agents, workflows and hosted apps](https://mistral.ai/news/build-with-studio/).
2. [Rivet presented its actor-based orchestration for agent workloads](https://news.ycombinator.com/item?id=50381687).
3. [Stroq demonstrated local audits and preventive hooks for coding agents](https://news.ycombinator.com/item?id=50380704).

## Agentic AI & Agent Skills

- **An enterprise runtime around the agent:** In its [November 5 Studio announcement](https://mistral.ai/news/build-with-studio/), Mistral adds managed agents with skills, code sandboxes, subagents and hooks; workflows combine fixed steps, agent decisions and human approvals, and can resume interrupted runs. Hosted apps can share those agents and workflows while using Studio authentication and access controls. Mistral says developers can build through its MCP server, test locally and deploy to Studio; the platform supports Mistral-hosted, VPC and on-premises deployments.
  - **What the announcement establishes—and what it does not:** Mistral describes its own incident-investigation agent and says an internal feedback-routing workflow saves its product-operations team **about 35 hours a week**. That is the company's account of its own use, not an independent measurement of reliability, savings for other teams or a guarantee that every deployment mode has identical capabilities. The [announcement was also linked on Hacker News on November 5 UTC](https://news.ycombinator.com/item?id=50380719).
- **Actors instead of a sandbox per agent:** In a [November 5 Launch HN post](https://news.ycombinator.com/item?id=50381687), Rivet's founders presented [open-source actor orchestration](https://github.com/rivet-dev/rivet) with per-actor state, SQLite persistence, WebSockets and idle hibernation. They describe an SSD write tier with S3 backing; their **72 KB** baseline per actor and latency comparisons are Rivet's own benchmarks, not a universal cost or security comparison with sandboxed agents.

## Tools & Open Source

- **Audit past sessions, hook future calls:** In a [November 5 Show HN post](https://news.ycombinator.com/item?id=50380704), Stroq presented its [local coding-agent audit and hooks](https://github.com/AGGIB/Stroq): the CLI examines existing sessions for secret exposure and command provenance, while optional hooks can block or request approval for subsequent tool calls. The author explicitly distinguishes retrospective auditing and a preventive filter from a sandbox; the repository does not establish that the hooks catch every indirect attack.
