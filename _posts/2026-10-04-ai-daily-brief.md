---
title: Aleph Alpha released Kolibri open weights as the MCP Python SDK updated
date: 2026-10-04 06:10:00 +0900
kind: Daily brief
summary: Aleph Alpha released Kolibri's open weights, the MCP Python SDK changed header validation and stream handling, and Codex merged an opt-in tool-discovery change.
figures:
  - value: "78B"
    label: Kolibri total parameters, according to Aleph Alpha
    url: https://huggingface.co/Aleph-Alpha/Kolibri-1
  - value: "1,048,576"
    label: Kolibri validated context tokens, according to Aleph Alpha's model card
    url: https://huggingface.co/Aleph-Alpha/Kolibri-1
  - value: "1 MiB"
    label: Default SSE event limit in the MCP Python SDK release notes
    url: https://github.com/modelcontextprotocol/python-sdk/releases/tag/v2.3.0
sources:
  - title: "Kolibri Has Landed: A Sovereign Open-Weight Model"
    url: https://aleph-alpha.com/en/blog/kolibri-has-landed-a-sovereign-open-weight-model/
    outlet: Aleph Alpha
  - title: "Aleph-Alpha/Kolibri-1 model card"
    url: https://huggingface.co/Aleph-Alpha/Kolibri-1
    outlet: Aleph Alpha / Hugging Face
  - title: "Release v2.3.0 · modelcontextprotocol/python-sdk"
    url: https://github.com/modelcontextprotocol/python-sdk/releases/tag/v2.3.0
    outlet: Model Context Protocol / GitHub
  - title: "Keep third-party tools deferred in strict Code Mode Only"
    url: https://github.com/openai/codex/commit/58ae3ba61186c39b849a6ebe60e60f4b11690373
    outlet: OpenAI / GitHub
  - title: "Kolibri: A Sovereign Open-Weight Model | Hacker News"
    url: https://news.ycombinator.com/item?id=49942706
    outlet: Hacker News
---

## TOP 3

1. [Aleph Alpha released the Kolibri model weights](https://aleph-alpha.com/en/blog/kolibri-has-landed-a-sovereign-open-weight-model/).
2. [The MCP Python SDK published v2.3.0](https://github.com/modelcontextprotocol/python-sdk/releases/tag/v2.3.0).
3. [Codex merged an opt-in change to third-party tool exposure](https://github.com/openai/codex/commit/58ae3ba61186c39b849a6ebe60e60f4b11690373).

## Models

- **Kolibri:** [Aleph Alpha's October 3 announcement](https://aleph-alpha.com/en/blog/kolibri-has-landed-a-sovereign-open-weight-model/) makes its German-English mixture-of-experts model available with open weights under Apache 2.0. Its [model card](https://huggingface.co/Aleph-Alpha/Kolibri-1) specifies 78B total and 3.46B active parameters per token, with reasoning and tool calling. Aleph Alpha says it validated context to 1,048,576 tokens but recommends no more than 262,144 for efficient serving and complex tasks; these are provider specifications, not independent evaluations.

## Agentic AI & Agent Skills

- **Codex tool discovery:** [An OpenAI Codex commit on October 3](https://github.com/openai/codex/commit/58ae3ba61186c39b849a6ebe60e60f4b11690373) adds a disabled-by-default feature for Code Mode Only that keeps eligible MCP, app and client-supplied dynamic tools deferred while discoverable and callable through `exec`. This is a source-code change, not an announced stable release; the commit says policy-denied and disabled tools remain restricted.

## MCP & Plug-in

- **Python SDK v2.3.0:** [The October 3 release](https://github.com/modelcontextprotocol/python-sdk/releases/tag/v2.3.0) adds a configurable SSE event-size limit (default 1 MiB), an option to turn off subscriptions, and one retry after a header-mismatch tool-call rejection. It also rejects invalid `x-mcp-header` tool annotations at registration and pauses request timeouts during interactive OAuth login; integrators should review the release's other behavior changes before upgrading.

## Tools & Open Source

Nothing new

## Community

- **Discussion, not validation:** In an [October 3 Hacker News thread](https://news.ycombinator.com/item?id=49942706), commenters focused on the detail in Kolibri's technical report and debated how much training-data disclosure an open model needs. Those comments show what readers are discussing, not independent evidence for the model's performance.

## Coverage

- The window was October 3, 06:00 to October 4, 06:00 Asia/Seoul. The configured web-search/extraction gateway failed repeatedly, so discovery relied on directly opened newsroom pages, GitHub releases and commits, Hugging Face, arXiv listings and public discussion pages. OpenAI and xAI newsrooms and Z.ai were not fully accessible; direct Reddit browsing presented a challenge, so community coverage is incomplete. The absence of an item in an empty section is not a claim that every source was exhaustively checked.
