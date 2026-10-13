---
title: Google launches Gemini 4 Argon for developers and paid subscribers
date: 2026-10-14 06:03:13 +0900
kind: Daily brief
summary: Gemini 4 Argon reaches the API and paid Google products; LiquidAI releases an on-device reasoning model, while Anthropic describes its agent-scale source-control replacement.
figures:
  - value: "$2"
    label: Introductory Gemini 4 Argon price per million input tokens, according to Google
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-argon/
  - value: "2B"
    label: Active parameters per token in LFM2.5-24B-A2B, according to LiquidAI
    url: https://huggingface.co/blog/LiquidAI/lfm25-24b-a2b
  - value: "over 30,000"
    label: Daily code changes merged at Anthropic as of September, according to Anthropic
    url: https://www.anthropic.com/engineering/redesigning-source-control
sources:
  - title: "Gemini 4 Argon: Built to solve your hardest problems"
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-argon/
    outlet: Google
  - title: Run fast, private agents on-device with LFM2.5-24B-A2B
    url: https://huggingface.co/blog/LiquidAI/lfm25-24b-a2b
    outlet: LiquidAI / Hugging Face
  - title: Redesigning source control at Anthropic
    url: https://www.anthropic.com/engineering/redesigning-source-control
    outlet: Anthropic
  - title: Building Long-Running Agents with ScaleDown and Deep Agents
    url: https://blog.langchain.com/building-long-running-agents-with-scaledown-and-deep-agents/
    outlet: LangChain
  - title: Search agent traces by behavior with AI Search in LangSmith
    url: https://blog.langchain.com/agent-traces-ai-search-langsmith/
    outlet: LangChain
---

## TOP 3

1. [Google launched Gemini 4 Argon through its API and paid products](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-argon/).
2. [LiquidAI released an on-device reasoning model with a sparse active footprint](https://huggingface.co/blog/LiquidAI/lfm25-24b-a2b).
3. [Anthropic detailed its replacement for Git in its own monorepo](https://www.anthropic.com/engineering/redesigning-source-control).

## Models

- **What launched:** In its [October 13 Gemini 4 Argon announcement](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-argon/), Google says the model is available to developers and enterprises via its API in AI Studio and Gemini platform; access in Antigravity is for Google AI Ultra subscribers, while the Gemini app and AI Mode in Search are for Ultra and Pro subscribers. Google lists an **introductory price of $2 per million input tokens and $10 per million output tokens**, with cached input tokens discounted. Its examples emphasize multi-step engineering and professional work, including an Agent Development Kit optimization that Google says reduced in-memory session preparation time in long sessions.
  - **What the announcement does not establish:** Google's benchmark rankings and internal productivity examples are its own reported results, not an independent test of reliability across users' codebases. The stated availability tiers do not mean unrestricted free access; the cited price is explicitly introductory, not a permanent price commitment.
- **Open-weight reasoning:** [LiquidAI's October 13 LFM2.5-24B-A2B release](https://huggingface.co/blog/LiquidAI/lfm25-24b-a2b) describes a 24B-parameter mixture-of-experts model with **2B active parameters per token**, an expanded 131K-token context window, and training inside agent harnesses. Its reported tool-use benchmarks and inference speeds are LiquidAI's own measurements, not independent comparisons.

## Agentic AI & Agent Skills

- **Context-management integration:** [LangChain's October 13 ScaleDown integration post](https://blog.langchain.com/building-long-running-agents-with-scaledown-and-deep-agents/) describes middleware for summarizing agent history, compressing tool results and extracting structured information, plus ScaleDown support in the LangSmith LLM Gateway. Its speed and cost comparisons are attributed to ScaleDown's own tests, not independently verified here.

## Tools & Open Source

- **Source control under agent load:** [Anthropic's October 13 engineering account](https://www.anthropic.com/engineering/redesigning-source-control) says it moved its monorepo from Git to its internal Scion system in five months after merges rose from around 2,500 a day in May to **over 30,000 a day** by September. Scion uses server-side changesets and sparse, on-demand working copies; these are Anthropic's workload and design choices, not a general claim that Git cannot scale for other teams.
- **Search by agent behavior:** [LangChain's October 13 LangSmith account](https://blog.langchain.com/agent-traces-ai-search-langsmith/) introduces AI Search for finding traces by a natural-language description of behavior, after structured filters narrow the candidates. It normalizes repeated messages into trajectories and applies a fixed token budget, so a match is a model classification over selected trace content rather than a guarantee it inspected every token.
