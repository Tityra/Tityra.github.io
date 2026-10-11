---
title: Talorys puts a personal AI agent in the user's Cloudflare account
date: 2026-10-11 11:33:31 +0900
kind: Daily brief
summary: A new self-hosted personal agent pairs Cloudflare Workers AI with private storage and schedules; Vigil repackaged its security-agent CLI, while llama.cpp fixed a server slot race.
sources:
  - title: "Talorys: Your personal AI agent. Your own cloud."
    url: https://github.com/rociiu/talorys
    outlet: Talorys / GitHub
  - title: Vigil 1.1.0 — Application releases and private workspaces
    url: https://github.com/VigilOSS/Vigil/releases/tag/v1.1.0
    outlet: Vigil OSS / GitHub
  - title: Release b11552
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11552
    outlet: llama.cpp / GitHub
---

## TOP 3

1. [Talorys made its self-hosted personal agent public](https://github.com/rociiu/talorys).
2. [Vigil shipped an installable application release separate from its operator workspaces](https://github.com/VigilOSS/Vigil/releases/tag/v1.1.0).
3. [llama.cpp fixed a server race involving busy slots and prompt-cache updates](https://github.com/ggml-org/llama.cpp/releases/tag/b11552).

## Agentic AI & Agent Skills

- **What Talorys offers:** The [Talorys repository](https://github.com/rociiu/talorys), created October 10, describes a single-user assistant deployed in the owner's Cloudflare account. Its browser frontend forwards requests through a Pages Function to a Worker without a public URL. A SQLite-backed Durable Object stores conversations, memory, tasks, notes and schedules; Workers AI supplies chat and tool calls, while Durable Object alarms run reminders. The installer configures resources, secrets and an owner password, then checks the deployed frontend and authentication path.
  - **What that does not establish:** The repository describes a free-tier-friendly design, not a guarantee of unlimited free inference: it says chat depends on Workers AI's daily allocation, while tasks and reminders continue when that allocation runs out. Its documented deployment check does not run model inference, and the repository is not an independent evaluation of the agent's reliability or security. Users still need their own Cloudflare account and must manage the resulting deployment.

## Tools & Open Source

- **Security-agent packaging:** [Vigil OSS's October 11 KST v1.1.0 release](https://github.com/VigilOSS/Vigil/releases/tag/v1.1.0) bundles its CLI, backend, prompts and prebuilt interface into an application wheel, so consumer installation no longer requires Git or Node. Existing private engagement workspaces are adopted in place; running services keep their prior release assets until restarted. The project documents authorized-use requirements for its offensive tooling.
- **Inference-server correctness:** The [llama.cpp b11552 prerelease](https://github.com/ggml-org/llama.cpp/releases/tag/b11552), published October 11 KST, changes its server to leave a busy slot untouched when a request pins that slot. Its release note says an earlier prompt-cache update could otherwise replace the context of an in-progress generation; the request now waits instead.
