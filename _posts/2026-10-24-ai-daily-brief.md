---
title: MCP TypeScript SDK adds Skills over MCP in v2.4.0
date: 2026-10-24 18:59:26 +0900
kind: Daily brief
summary: The MCP TypeScript SDK ships skill publication and retrieval; Kimi details K3.1 Pro access, while Ai2 presents LitPivot for literature-grounded research ideas.
figures:
  - value: "1M"
    label: Token context window specified by Kimi for K3.1 Pro
    url: https://www.kimi.ai/blog/kimi-k3-1-pro
  - value: "17"
    label: Researchers in Ai2's LitPivot laboratory study, as reported by Ai2
    url: https://huggingface.co/blog/allenai/litpivot
sources:
  - title: TypeScript SDK v2.4.0 release
    url: https://github.com/modelcontextprotocol/typescript-sdk/releases/tag/v2.4.0
    outlet: Model Context Protocol / GitHub
  - title: Introducing Kimi K3.1 Pro
    url: https://www.kimi.ai/blog/kimi-k3-1-pro
    outlet: Moonshot AI / Kimi
  - title: Kimi K3.1 Pro and K3.1 Pro Highspeed discussion
    url: https://news.ycombinator.com/item?id=50212065
    outlet: Hacker News
  - title: "LitPivot: Developing research ideas through dynamic contextualization within the literature landscape"
    url: https://huggingface.co/blog/allenai/litpivot
    outlet: Ai2 / Hugging Face
---

## TOP 3

1. [The MCP TypeScript SDK shipped a way to publish and retrieve Agent Skills through the protocol](https://github.com/modelcontextprotocol/typescript-sdk/releases/tag/v2.4.0).
2. [Kimi detailed access to K3.1 Pro and a later timetable for its full weights](https://www.kimi.ai/blog/kimi-k3-1-pro).
3. [Ai2 presented LitPivot, a literature-grounded research-idea editor](https://huggingface.co/blog/allenai/litpivot).

## Models

- **Kimi K3.1 Pro:** [Moonshot AI's Kimi announcement, updated October 24](https://www.kimi.ai/blog/kimi-k3-1-pro), says K3.1 Pro and a faster Highspeed variant are available through its site, Work, Code and API, while **full model weights are promised by November 4**, not available now. It specifies a **1M-token context window**; its coding and finance comparisons are the company's own benchmark claims. The announcement itself supplies an update date rather than an original publication timestamp; an [October 24 Hacker News submission](https://news.ycombinator.com/item?id=50212065) establishes when the page was being discussed, not when access first opened.

## MCP & Plug-in

- **What shipped:** The [MCP TypeScript SDK v2.4.0 release, published October 24 in Korea](https://github.com/modelcontextprotocol/typescript-sdk/releases/tag/v2.4.0), introduces **Skills over MCP**: a server can publish a skills folder with `loadSkills(folder)` and `skills.attach(server)`, while a client can list, read and verify those skills with `SkillsClient`. The release says this works on both its 2025-11-25 and 2026-07-28 protocol revisions; it also adds an installable agent skill for upgrading from the SDK's v1 to v2 line.
  - **What to check before upgrading:** `skills.attach` is explicitly experimental and may change in a minor release. The same notes say a numeric `x-mcp-header` parameter is rejected under the newer spec, and a legacy connection no longer wraps certain structured outputs in `{ result }`. Neither the release notes nor the presence of client verification establishes that a retrieved skill is safe to execute.

## Tools & Open Source

- **Literature-backed idea revisions:** In its [October 23 article, published after midnight October 24 in Korea](https://huggingface.co/blog/allenai/litpivot), Ai2 describes LitPivot: it groups retrieved papers around a proposal's problem, contribution or evaluation facet and offers excerpt-supported critiques and editable revisions. Ai2 reports that domain experts rated proposals from its **17-researcher** laboratory study as better grounded in relevant literature than those written with a text editor and an AI chat tool; the article describes a study, not a general guarantee for research quality.
