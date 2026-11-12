---
title: Google introduces Gemini 4 Hydrogen for everyday coding and agent workflows
date: 2026-11-13 06:03:27 +0900
kind: Daily brief
summary: Google's general-purpose Hydrogen model and Antigravity routing lead; Salesforce releases open-weight speech recognition, and AgentRun opens its managed-agent platform.
figures:
  - value: "1 million"
    label: Gemini 4 Hydrogen context-window tokens, as stated by Google
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/
  - value: "$1.50 / $7.50"
    label: Google's Hydrogen API price per million input / output tokens
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/
  - value: "2.28%"
    label: Salesforce's reported word error rate for SOV-Transcribe-1 on Artificial Analysis
    url: https://huggingface.co/blog/salesforce-sovereign-intelligence/sov-transcribe-1
sources:
  - title: Introducing Gemini 4 Hydrogen
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/
    outlet: Google
  - title: Gemini 4 Hydrogen and Orchestrator
    url: https://antigravity.google/blog/gemini-4-hydrogen-in-google-antigravity/
    outlet: Google Antigravity
  - title: "Introducing Salesforce SOV-Transcribe-1: #1 Open-Weight Model Built for Real-World Speech"
    url: https://huggingface.co/blog/salesforce-sovereign-intelligence/sov-transcribe-1
    outlet: Salesforce / Hugging Face
  - title: SOV-Transcribe-1 model card
    url: https://huggingface.co/salesforce-sovereign-intelligence/SOV-Transcribe-1
    outlet: Salesforce / Hugging Face
  - title: "Show HN: AgentRun – open-source, Self-improving Managed Agents"
    url: https://news.ycombinator.com/item?id=50471650
    outlet: Hacker News
  - title: AgentRun repository and README
    url: https://github.com/Parcha-ai/agentrun
    outlet: Parcha-ai / GitHub
  - title: Hacker News discussion of Gemini 4 Hydrogen and Orchestrator
    url: https://news.ycombinator.com/item?id=50472260
    outlet: Hacker News
---

## TOP 3

1. [Google released Gemini 4 Hydrogen for general-purpose coding and agent workflows](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/).
2. [Salesforce published the open-weight SOV-Transcribe-1 speech model](https://huggingface.co/blog/salesforce-sovereign-intelligence/sov-transcribe-1).
3. [AgentRun's makers presented their open-source managed-agent platform](https://news.ycombinator.com/item?id=50471650).

## Models

- **A general-purpose model after yesterday's task-specific endpoint:** In its [November 12 announcement, “Introducing Gemini 4 Hydrogen”](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/), Google introduced Hydrogen for everyday coding and agentic workflows, with access across AI Studio tiers, the Gemini API and other Google products. Its stated **1 million-token context window** carries a flat API price of **$1.50 per million input tokens and $7.50 per million output tokens**. Google also introduced [Antigravity's Orchestrator](https://antigravity.google/blog/gemini-4-hydrogen-in-google-antigravity/), which switches between Hydrogen and the more demanding Carbon within a session; Hydrogen is rolling out there to paid Pro and Ultra subscribers, while Orchestrator is rolling out to Ultra subscribers.
  - **What the sources do not establish:** Google's speed, quality and quota comparisons are its own tests, not a guarantee for a particular developer workload. The announcement describes several product rollouts, not identical access to Orchestrator across every subscription tier. Unlike yesterday's bounded Decisions API, this release changes the general-purpose model available to developers, which is why a Google announcement leads again.
- **Speech transcription weights:** In its [November 12 release post](https://huggingface.co/blog/salesforce-sovereign-intelligence/sov-transcribe-1), Salesforce introduced the Apache-licensed [SOV-Transcribe-1 model](https://huggingface.co/salesforce-sovereign-intelligence/SOV-Transcribe-1) for non-streaming transcription, including formatting instructions and vocabulary hints. Salesforce reports **2.28% word error rate** on Artificial Analysis; the model card says native vLLM and Transformers integrations are still being upstreamed, with a plugin and repository code available in the meantime.

## Agentic AI & Agent Skills

- **Managed agents with retained learning:** In its [November 12 Show HN launch](https://news.ycombinator.com/item?id=50471650), the AgentRun team opened its [Apache-licensed platform](https://github.com/Parcha-ai/agentrun) for durable agent runs, sandboxed environments, approvals and notes, skills or workflows retained between runs. Its README describes the architecture and self-hosting path; claims of lower per-run cost are the team's own examples, not a general performance result.

## Community

- **Discussion of automatic model routing:** In the [November 12 Hacker News thread](https://news.ycombinator.com/item?id=50472260), developers questioned how Antigravity's switching interacts with caching and quota, while others preferred choosing models for specific subagent roles themselves. These comments describe developer concerns, not independently verified product measurements.
