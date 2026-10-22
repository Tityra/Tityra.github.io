---
title: Anthropic donates Agent Skills to the Agentic AI Foundation
date: 2026-10-23 06:05:36 +0900
kind: Daily brief
summary: Anthropic moves the Agent Skills standard to a neutral foundation; Ai2 releases global satellite embeddings, IBM publishes a forecasting ensemble, and a Claude Code usage guard reaches Show HN.
figures:
  - value: "70+"
    label: Agent platforms Anthropic says have integrated Agent Skills
    url: https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation
  - value: "20 of 27"
    label: Evaluations on which Ai2 says its 128-dimensional OlmoEarth embeddings scored highest
    url: https://huggingface.co/blog/allenai/olmoearth-v1-3
sources:
  - title: Donating Agent Skills to the Agentic AI Foundation
    url: https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation
    outlet: Anthropic
  - title: "OlmoEarth v1.3: State-of-the-art embeddings for the whole planet"
    url: https://huggingface.co/blog/allenai/olmoearth-v1-3
    outlet: Ai2 / Hugging Face
  - title: Ensemble forecasting with IBM Granite time-series models
    url: https://huggingface.co/blog/ibm-research/granite-timeseries-ensemble-r1
    outlet: IBM Research / Hugging Face
  - title: "Show HN: agent-usage-guard – a Claude Code mod to protect your usage window"
    url: https://news.ycombinator.com/item?id=50198936
    outlet: Hacker News
  - title: agent-usage-guard repository and README
    url: https://github.com/rbartoli/agent-usage-guard
    outlet: rbartoli / GitHub
---

## TOP 3

1. [Anthropic donated the Agent Skills standard to the Agentic AI Foundation](https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation).
2. [Ai2 released OlmoEarth v1.3 and precomputed satellite embeddings](https://huggingface.co/blog/allenai/olmoearth-v1-3).
3. [IBM published a four-model Granite time-series forecasting ensemble](https://huggingface.co/blog/ibm-research/granite-timeseries-ensemble-r1).

## Models

- **Satellite embeddings:** In its [October 22 release](https://huggingface.co/blog/allenai/olmoearth-v1-3), Ai2 introduced OlmoEarth v1.3 with annual, global satellite embeddings at 10-meter resolution and an interactive explorer; it says the weights, training data and code are open. Ai2 reports that its 128-dimensional embeddings scored highest on **20 of 27** evaluations against AlphaEarth Foundations and Tessera v2. These are Ai2's comparisons, not an independent guarantee for every mapping task.
- **Time-series ensemble:** IBM Research's [October 22 article](https://huggingface.co/blog/ibm-research/granite-timeseries-ensemble-r1) describes a permissively licensed recipe that combines four Granite forecasting architectures without fitting ensemble weights and returns median and quantile forecasts. IBM recommends uniform probability pooling by default and cautions that its alternative, spread-based weighting can favor an overconfident model.

## Agentic AI & Agent Skills

- **What changed:** In its [October 22 announcement](https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation), Anthropic said it is donating the Agent Skills standard to the Agentic AI Foundation under the Linux Foundation, including the name and logo, GitHub organization and agentskills.io domain. A skill remains a folder with a `SKILL.md` file and optional scripts or reference material; the handoff concerns governance of that format, not a new Claude model or a mandatory migration for existing skills.
  - **Scope and limits:** Anthropic says **more than 70** agent platforms have integrated Agent Skills and names ChatGPT, Cursor, GitHub Copilot and VS Code among them. It proposes versioned releases, a formal proposal process and security guidance, but describes these as a proposed roadmap rather than completed specification changes. The announcement says people can keep using or contributing to the standard without joining the foundation; it does not give an adoption breakdown by platform or a date for the proposed releases.

## Tools & Open Source

- **Usage guard:** An [October 22 Show HN submission](https://news.ycombinator.com/item?id=50198936) presented [agent-usage-guard](https://github.com/rbartoli/agent-usage-guard), a Claude Code mod that asks before costly prompt or subagent activity and counts concurrent agents across local sessions. Its README says it makes no network calls and normally fails open if a hook errors; the submission dates its presentation, not the repository's original creation.
