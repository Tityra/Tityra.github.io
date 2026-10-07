---
title: Anthropic released Claude Haiku 5.5 and cut Sonnet cache-read pricing
date: 2026-10-08 06:05:40 +0900
kind: Daily brief
summary: Anthropic launched a lower-cost Haiku model; Liquid AI released multimodal decision weights, while LangChain expanded agent skills and NVIDIA and Microsoft announced new local-AI hardware and agent infrastructure.
figures:
  - value: "75%"
    label: Average reduction in Haiku 5.5 running cost versus Haiku 4.5, according to Anthropic
    url: https://www.anthropic.com/claude-haiku-5-5
  - value: "$0.10"
    label: Haiku 5.5 input price per million tokens for prompts up to 100,000 tokens, according to Anthropic
    url: https://www.anthropic.com/claude-haiku-5-5
  - value: "128GB"
    label: Maximum RTX Spark unified memory, according to NVIDIA
    url: https://blogs.nvidia.com/blog/local-ai-rtx-spark-microsoft-windows-event/
sources:
  - title: Introducing Claude Haiku 5.5
    url: https://www.anthropic.com/claude-haiku-5-5
    outlet: Anthropic
  - title: Multimodal open d1 decision models for the edge
    url: https://huggingface.co/blog/LiquidAI/open-d1
    outlet: Liquid AI / Hugging Face
  - title: Revamping Skills in Deep Agents
    url: https://www.langchain.com/blog/revamping-skills-in-deep-agents
    outlet: LangChain
  - title: "Managed Deep Agents v0.9: schedules, per-run configuration, and Slack reactions"
    url: https://www.langchain.com/blog/managed-deep-agents-schedules-per-run-configuration-slack
    outlet: LangChain
  - title: NVIDIA, Microsoft Kick Off a New Beginning for Windows PCs With RTX Spark and AI Agents
    url: https://blogs.nvidia.com/blog/local-ai-rtx-spark-microsoft-windows-event/
    outlet: NVIDIA
  - title: "Introducing Playground: Create and play custom games"
    url: https://blog.google/innovation-and-ai/technology/ai/playground-experimental-gaming-platform/
    outlet: Google
---

## TOP 3

1. [Anthropic launched Claude Haiku 5.5 and lowered Sonnet 5.5 cache-read pricing](https://www.anthropic.com/claude-haiku-5-5).
2. [NVIDIA and Microsoft announced RTX Spark Windows PCs and agent execution containers](https://blogs.nvidia.com/blog/local-ai-rtx-spark-microsoft-windows-event/).
3. [Liquid AI released open multimodal d1 decision-model weights](https://huggingface.co/blog/LiquidAI/open-d1).

## Models

- **Claude Haiku 5.5:** In its [October 7 launch](https://www.anthropic.com/claude-haiku-5-5), Anthropic positions the new small model for high-volume tasks, including summaries, classification, browser use and coding subagents. It is available through the Claude Platform as `claude-haiku-5-5` and on AWS, Google Cloud and Azure; it is the first Haiku-class model with adjustable effort. Anthropic lists input at $0.10 and output at $0.50 per million tokens for prompts up to 100,000 tokens, with higher rates above that threshold. It says average running cost is around 75% below Haiku 4.5, accounting for task token usage; this is not a flat 75% discount on every request.
  - **The accompanying change and the limit:** Anthropic also halved Sonnet 5.5 cache reads to $0.10 per million tokens, from $0.20, and says this makes most agentic work around 20% cheaper. Its benchmark comparisons and safety results are Anthropic's evaluations, not independent verification here. The company itself still recommends Sonnet or Opus over Haiku for complex agentic coding; the promised monthly API credits for Max and Team subscribers roll out later this week, rather than being part of the model's immediate availability.
- **Open d1 decision models:** [Liquid AI's October 7 release](https://huggingface.co/blog/LiquidAI/open-d1) makes d1-3B (text and image) and experimental d1-omni-600M (text and image or text and audio) weights available. These models answer structured questions in a forward pass rather than generating tokens; the speed and benchmark figures are Liquid AI's own, and it does not report vision or audio benchmark results.

## Agentic AI & Agent Skills

- **Deep Agents skills:** [LangChain's October 7 update](https://www.langchain.com/blog/revamping-skills-in-deep-agents) adds tools bound to skills that load when the skill is read, runtime-pinned skills that load before the next model call, and a way to refresh the skill library mid-thread; prompt-cache preservation for newly added tools depends on the model's support.
- **Managed Deep Agents:** [LangChain's October 7 v0.9 release](https://www.langchain.com/blog/managed-deep-agents-schedules-per-run-configuration-slack) adds agent-created schedules, per-run selection of model, skills and tools, and Slack acknowledgement reactions. It remains in public beta; scheduled runs use the requester's permissions and return to the originating channel.

## Tools & Open Source

- **Windows local AI:** [NVIDIA's October 7 account of its Microsoft event](https://blogs.nvidia.com/blog/local-ai-rtx-spark-microsoft-windows-event/) says RTX Spark laptop preorders opened, with devices due October 16 and compact desktops in November. Microsoft announced general availability of Microsoft Execution Containers for agents running under OS control; NVIDIA also previewed, rather than released, DGX Station for Windows. The stated RTX Spark ceiling is 128GB of unified memory.
- **Prompt-to-game creation:** [Google's October 7 announcement](https://blog.google/innovation-and-ai/technology/ai/playground-experimental-gaming-platform/) introduces Playground, a browser-based experimental platform to create and share games through prompts. It launches for U.S. adults with tiered creation access by Google AI subscription; the Unity Spark integration is still in testing, not a launch feature.
