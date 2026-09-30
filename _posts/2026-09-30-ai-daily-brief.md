---
title: Cohere released Embed 5 as Cloudflare expanded its agent tools
date: 2026-09-30 23:34:00 +0900
kind: Daily brief
summary: Embed 5, Cloudflare's new agent infrastructure, OpenClaw's update, and fresh open-source and MCP work.
sources:
  - title: Introducing Embed 5—A New Family of Frontier Embedding Models
    url: https://cohere.com/blog/embed-5
    outlet: Cohere
  - title: Cut your AI spend with AI Gateway's Auto Router
    url: https://blog.cloudflare.com/auto-router/
    outlet: Cloudflare
  - title: Cloudflare Containers, rebuilt to scale agent sandboxes
    url: https://blog.cloudflare.com/faster-agent-sandboxes/
    outlet: Cloudflare
  - title: Detect and send production issues straight to your agent
    url: https://blog.cloudflare.com/real-time-issue-detection/
    outlet: Cloudflare
  - title: 'Monetization Gateway beta: charge AI agents for consumption with HTTP 402'
    url: https://blog.cloudflare.com/monetization-gateway-beta/
    outlet: Cloudflare
  - title: Release openclaw 2026.9.7
    url: https://github.com/openclaw/openclaw/releases/tag/v2026.9.7
    outlet: OpenClaw / GitHub
  - title: BAAI/AREX-2
    url: https://huggingface.co/BAAI/AREX-2
    outlet: BAAI / Hugging Face
  - title: 'fix(client): retry the SSE connection once after onUnauthorized'
    url: https://github.com/modelcontextprotocol/typescript-sdk/commit/c0cd01a21d867e57b29d7216416b25bf36898292
    outlet: Model Context Protocol / GitHub
  - title: add GLM-5.3-Flash (GLM5-Next) support
    url: https://github.com/ggml-org/llama.cpp/pull/27773
    outlet: llama.cpp / GitHub
  - title: 'UserProxyBench: Evaluating LLM User Simulators for Agent Benchmarks and Training'
    url: https://arxiv.org/abs/2609.38043v1
    outlet: arXiv
  - title: “You Said No MCP!”
    url: https://earendil.com/posts/you-said-no-mcp/
    outlet: Earendil Engineering
  - title: 'Pi.dev: You Said No MCP | Hacker News'
    url: https://news.ycombinator.com/item?id=49906637
    outlet: Hacker News
---

## TOP 3

1. [Cohere introduced Embed 5 Pro and Fast](https://cohere.com/blog/embed-5), embedding models that share an embedding space and accept text and images.
2. [Cloudflare opened AI Gateway Auto Router in public beta](https://blog.cloudflare.com/auto-router/) and [made Containers more programmable for agent sandboxes](https://blog.cloudflare.com/faster-agent-sandboxes/).
3. [OpenClaw released version 2026.9.7](https://github.com/openclaw/openclaw/releases/tag/v2026.9.7), adding update safeguards and an OpenAI Agents API plugin.

## Models

- **Embed 5:** [Cohere's September 30 release](https://cohere.com/blog/embed-5) says Pro and Fast share an embedding space, so an index built with Pro can be queried with either model. Cohere lists API prices of $0.12 and $0.08 per million tokens, respectively; its retrieval comparisons are vendor evaluations.
- **AREX-2:** [BAAI published model weights and a card](https://huggingface.co/BAAI/AREX-2) for an agent model trained for feedback-driven, multi-round improvement. The model card describes its training and evaluations; those results are the authors' claims.

## Agentic AI & Agent Skills

- **Routing and sandboxes:** [Cloudflare's Auto Router](https://blog.cloudflare.com/auto-router/) routes compatible AI Gateway requests sent to `cloudflare/auto`. Cloudflare reports *up to* 30% cost savings in its own early OpenCode use, not a general guarantee. [Containers](https://blog.cloudflare.com/faster-agent-sandboxes/) now allow code to choose a sandbox image and instance type at runtime; filesystem snapshots are in public beta.
- **Production handoffs:** [Cloudflare Workers Issues](https://blog.cloudflare.com/real-time-issue-detection/) is in open beta. It groups failures and can send logs, traces and version context to a configured coding agent; it is not a claim that the agent fixes the bug autonomously.
- **Agent payments:** [Cloudflare's Monetization Gateway](https://blog.cloudflare.com/monetization-gateway-beta/) is in *closed* beta, allowing enrolled site and API owners to charge agents for access, including to MCP tools and datasets.

## MCP & Plug-in

- **SDK work, not a protocol release:** A [TypeScript MCP client commit](https://github.com/modelcontextprotocol/typescript-sdk/commit/c0cd01a21d867e57b29d7216416b25bf36898292) adds one SSE connection retry after `onUnauthorized()` resolves; this is a repository change, not a new SDK version.
- **Pi integration:** [Earendil Engineering says](https://earendil.com/posts/you-said-no-mcp/) Pi now supports MCP in its core and explains its interpreter-based approach to composing tool calls. The explanation was posted September 29; the separate community discussion below surfaced September 30.

## Tools & Open Source

- **OpenClaw:** The [2026.9.7 release notes](https://github.com/openclaw/openclaw/releases/tag/v2026.9.7) describe backups before state and agent-database migrations, rollback changes, and a plugin for OpenAI's Agents API.
- **Local inference:** A [merged llama.cpp pull request](https://github.com/ggml-org/llama.cpp/pull/27773) adds GLM-5.3-Flash text and vision support. Its author notes that MTP is separate and multiple sequences require `--kv-unified`.
- **Agent evaluations:** The [UserProxyBench preprint](https://arxiv.org/abs/2609.38043v1) reports that varying only the simulated user changed mean reward by 15.2 points across 375 tasks. That is the authors' study result, not a general benchmark correction factor.

## Community

- **MCP debate:** In a [September 30 Hacker News thread](https://news.ycombinator.com/item?id=49906637) about [Pi's integration](https://earendil.com/posts/you-said-no-mcp/), participants discuss whether MCP tools, resources and prompts compose well across clients. These are developer views, not changes to the MCP specification.
