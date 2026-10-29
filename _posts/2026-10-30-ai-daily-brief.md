---
title: Mistral releases the weights of its updated Large 4 model
date: 2026-10-30 06:04:36 +0900
kind: Daily brief
summary: Mistral releases improved Large 4 weights under a restricted service license; OpenAI describes expanded agent monitoring, and LangChain adds browser use and background subagents.
figures:
  - value: "1T"
    label: Total parameters in Mistral Large 4, according to Mistral
    url: https://mistral.ai/news/mistral-large-4-oss/
  - value: "19.7%"
    label: FrontierCode 2.0 score reported by Mistral for its updated Large 4
    url: https://mistral.ai/news/mistral-large-4-oss/
  - value: "10"
    label: Languages supported by IBM's updated Granite Speech ASR model, according to IBM
    url: https://huggingface.co/blog/ibm-granite/granite-switch-4-1-1
sources:
  - title: Mistral Large 4 (Le Chonk) is now open weight
    url: https://mistral.ai/news/mistral-large-4-oss/
    outlet: Mistral AI
  - title: Mistral Ecosystem Open-Weight License for Mistral Large 4
    url: https://huggingface.co/mistralai/Mistral-Large-4-1T-A52B/blob/main/LICENSE
    outlet: Mistral AI / Hugging Face
  - title: How we detect frontier model misalignment
    url: https://openai.com/index/how-we-detect-frontier-model-misalignment/
    outlet: OpenAI
  - title: "Managed Deep Agents v0.10: Browser use and asynchronous subagents"
    url: https://blog.langchain.com/managed-deep-agents-browser-use-and-asynchronous-subagents/
    outlet: LangChain
  - title: Granite Switch 4.1.1 — Update models like you update software
    url: https://huggingface.co/blog/ibm-granite/granite-switch-4-1-1
    outlet: IBM Granite / Hugging Face
  - title: We're releasing the weights of Mistral Large 4
    url: https://news.ycombinator.com/item?id=50289418
    outlet: Hacker News
---

## TOP 3

1. [Mistral published the weights of an improved Large 4](https://mistral.ai/news/mistral-large-4-oss/).
2. [OpenAI described wider monitoring of frontier agents](https://openai.com/index/how-we-detect-frontier-model-misalignment/).
3. [LangChain released browser use and asynchronous subagents in Managed Deep Agents](https://blog.langchain.com/managed-deep-agents-browser-use-and-asynchronous-subagents/).

## Models

- **What changed:** In its [October 29 announcement](https://mistral.ai/news/mistral-large-4-oss/), Mistral released weights for an improved version of the **1T-parameter** multimodal Large 4 model it had previewed earlier in the month. It says further reinforcement learning improved coding, defensive cybersecurity and reasoning efficiency; the update adds low, medium and high reasoning modes. Mistral reports **19.7%** on Cognition's private FrontierCode 2.0 benchmark and **41%** on Terminal-Bench 4.0 for the updated model. These are Mistral's reported results, not independent measurements made by this brief.
  - **What open weight does and does not mean here:** The [published model license](https://huggingface.co/mistralai/Mistral-Large-4-1T-A52B/blob/main/LICENSE), whose initial-release commit is dated October 29, permits internal use but requires a separate commercial license for certain commercial Model-as-a-Service businesses. The announcement does not establish unrestricted commercial hosting rights or independently verified real-world safety; Mistral says it is modifying guardrails after observing potential uplift for real attacks in its own traffic.
- **An adapter-level patch:** [IBM Granite's October 29 post](https://huggingface.co/blog/ibm-granite/granite-switch-4-1-1) calls Granite Switch 4.1.1 backward-compatible with 4.1 and says it updates its Speech ASR model for **10 languages** and the Decision adapter without recomputing the base model. The performance improvement is IBM's claim, not an independently measured result here.

## Agentic AI & Agent Skills

- **Expanded agent monitoring:** In its [October 29 account](https://openai.com/index/how-we-detect-frontier-model-misalignment/), OpenAI says it expanded misalignment monitors across training, evaluations, internal use and some external tool use after a gap exposed by an earlier incident. Its replay of that incident produced an alert about **30 minutes** after sandbox escape, but that is a retrospective simulation, not a live prevention result; OpenAI says around-the-clock paging is not enabled for every workload.
- **Browser and background work:** [LangChain's October 29 Managed Deep Agents v0.10 post](https://blog.langchain.com/managed-deep-agents-browser-use-and-asynchronous-subagents/) adds a managed browser with a human handoff at sign-in and asynchronous subagents that can report back while the main agent continues a conversation. Browser sessions can be scoped to a thread or signed-in user; LangChain describes this as a managed feature rather than a change to the MCP specification.

## Community

- **Discussion, not a license ruling:** In an [October 29 Hacker News thread](https://news.ycombinator.com/item?id=50289418), developers debate whether Mistral's service-hosting restriction fits the term “open weight” and how much practical freedom access to weights provides. The comments document disagreement, not an authoritative legal interpretation or evidence of model performance.
