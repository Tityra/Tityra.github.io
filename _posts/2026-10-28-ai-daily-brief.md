---
title: Google DeepMind previews Genie 4 with live audio and steerable worlds
date: 2026-10-28 06:02:23 +0900
kind: Daily brief
summary: Google DeepMind previews an interactive world model; Liquid AI introduces multimodal LFM3, while two agent-control tools reach Show HN.
figures:
  - value: "256K"
    label: Context window Liquid AI states for its LFM3 text model
    url: https://www.liquid.ai/blog/lfm3
  - value: "22T"
    label: Pre-training tokens Liquid AI states for LFM3-1.7B-Base
    url: https://www.liquid.ai/blog/lfm3
sources:
  - title: "Genie 4: A new generation of world simulation"
    url: https://deepmind.google/blog/genie-4-a-new-generation-of-world-simulation/
    outlet: Google DeepMind
  - title: "Introducing LFM3: Every Modality for Specialized Intelligence"
    url: https://www.liquid.ai/blog/lfm3
    outlet: Liquid AI
  - title: "Bouncer repository and README"
    url: https://github.com/Ezed9/mcp-bouncer
    outlet: Ezed9 / GitHub
  - title: "Show HN: Bouncer, an MCP proxy that denies sends to addresses the agent read"
    url: https://news.ycombinator.com/item?id=50259501
    outlet: Hacker News
  - title: "agent-relay repository and README"
    url: https://github.com/saranyan/agent-relay
    outlet: saranyan / GitHub
  - title: "Show HN: Agent-relay for multi-vendor coding sessions"
    url: https://news.ycombinator.com/item?id=50262407
    outlet: Hacker News
---

## TOP 3

1. [Google DeepMind began a limited research preview of Genie 4](https://deepmind.google/blog/genie-4-a-new-generation-of-world-simulation/).
2. [Liquid AI introduced the multimodal LFM3 model family](https://www.liquid.ai/blog/lfm3).
3. [Bouncer, an MCP proxy for constraining agent writes, was presented on Show HN](https://news.ycombinator.com/item?id=50259501).

## Models

- **What the preview does:** In its [October 27 announcement](https://deepmind.google/blog/genie-4-a-new-generation-of-world-simulation/), Google DeepMind describes Genie 4 as an interactive world model that generates a changing scene and its audio together. Testers can navigate with keyboard controls and steer a running scene with text, including changes to weather or objects; the demonstrations also show characters speaking in response to the scene. Google says Gemini models help ground the visual simulation and guide multi-step events as they unfold.
  - **Who can use it, and what is not established:** DeepMind says the research preview has begun with trusted testers; broader access is planned first for Google AI Ultra subscribers through Project Genie and early partners through the Gemini API and Google AI Studio. The announcement does not provide general developer availability, pricing or an independent evaluation of physical accuracy. Its demonstrations are examples, not evidence that every generated environment behaves like the real world.
- **A multimodal edge-model family:** [Liquid AI's October 27 LFM3 announcement](https://www.liquid.ai/blog/lfm3) introduces text, vision, audio, omni and decision models built on a shared backbone, with open weights and local fine-tuning guides. The company specifies a **256K** context window for the text model and **22T** pre-training tokens for LFM3-1.7B-Base; performance comparisons in the post are Liquid AI's own measurements.

## Agentic AI & Agent Skills

- **Cross-vendor session hand-offs:** An [October 27 Show HN submission](https://news.ycombinator.com/item?id=50262407) presented [agent-relay](https://github.com/saranyan/agent-relay), whose README describes turn-by-turn coordination between Claude Code and Codex with a local record and pauses for user decisions. The repository predates the submission; the new event is the public presentation, and its README says work inside an agent turn remains invisible to the relay.

## MCP & Plug-in

- **A deterministic MCP write gate:** An [October 27 Show HN submission](https://news.ycombinator.com/item?id=50259501) presented [Bouncer](https://github.com/Ezed9/mcp-bouncer), an MCP proxy that denies sends to destinations first seen in untrusted tool output and logs decisions. The project says it does not detect prompt injection, only covers MCP calls, and in its own AgentDojo run also blocked legitimate sends; this is a presentation of an existing repository, not a newly dated protocol change.
