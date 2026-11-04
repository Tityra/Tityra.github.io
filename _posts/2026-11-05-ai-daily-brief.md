---
title: Datasette Agent adds permission-aware references and a stoppable chat workflow
date: 2026-11-05 06:04:34 +0900
kind: Daily brief
summary: Datasette Agent's prerelease changes its chat and tool controls; a document-field model, an MCP tester and browser speech runtime also surfaced.
figures:
  - value: "546"
    label: Documents in Dharma AI's own Field Extractor benchmark
    url: https://huggingface.co/blog/Dharma-AI/dharma-field-extractor
  - value: "115×"
    label: Real-time speech generation in Phonon's author's M3 Max WebGPU test
    url: https://github.com/blixt/phonon
sources:
  - title: Datasette Agent 0.5a0 release
    url: https://github.com/datasette/datasette-agent/releases/tag/0.5a0
    outlet: Datasette / GitHub
  - title: "Dharma Field Extractor: Any Document In, Structured Fields in JSON Out"
    url: https://huggingface.co/blog/Dharma-AI/dharma-field-extractor
    outlet: Dharma AI / Hugging Face
  - title: "Show HN: QAmcp — an open-source tester and monitor for MCP servers"
    url: https://news.ycombinator.com/item?id=50366061
    outlet: Hacker News
  - title: QAmcp project and testing documentation
    url: https://github.com/QAmcp/qamcp-cli
    outlet: QAmcp / GitHub
  - title: QAmcp monitoring and testing overview
    url: https://qamcp.dev/
    outlet: QAmcp
  - title: "Show HN: Phonon TTS on WebGPU"
    url: https://news.ycombinator.com/item?id=50369215
    outlet: Hacker News
  - title: Phonon WebGPU runtime and benchmarks
    url: https://github.com/blixt/phonon
    outlet: blixt / GitHub
---

## TOP 3

1. [Datasette Agent shipped a prerelease with new chat references and control over running conversations](https://github.com/datasette/datasette-agent/releases/tag/0.5a0).
2. [Dharma AI described a document-to-JSON field extraction model](https://huggingface.co/blog/Dharma-AI/dharma-field-extractor).
3. [A WebGPU speech runtime with word-level timings appeared on Show HN](https://news.ycombinator.com/item?id=50369215).

## Models

- **Fields rather than a page transcript:** In its [November 4 Field Extractor report](https://huggingface.co/blog/Dharma-AI/dharma-field-extractor), Dharma AI describes a 2-billion-parameter document-image model that returns typed JSON either from an open request or a caller-specified schema. Its own evaluation covers **546 documents** under three request scenarios and reports higher extraction scores than the frontier configurations it tested; those comparisons are the authors' measurements, not an independent benchmark.

## Agentic AI & Agent Skills

- **The agent gets bounded context and a visible stop:** The [November 4 Datasette Agent 0.5a0 prerelease](https://github.com/datasette/datasette-agent/releases/tag/0.5a0) lets users tag tables, databases and stored queries in chat, passing their details to the model subject to the sender's permissions. It also pins a selected model per conversation, keeps turns running across navigation and adds a Stop button; a tool call already in progress is allowed to finish before the agent stops. The release fixes a missing-system-prompt bug for some model plugins and makes the system prompt independent of the database schema for provider caching. These are prerelease features and implementation notes, not evidence of improved task success or production reliability.

## MCP & Plug-in

- **Test an MCP server before trusting its tools:** In a [November 4 Show HN submission](https://news.ycombinator.com/item?id=50366061), QAmcp presented [open-source checks](https://github.com/QAmcp/qamcp-cli) for server connections, tool descriptions, safety labels, bad inputs and leaked secrets. Its [project site](https://qamcp.dev/) also describes monitoring and alerts for server or tool changes. The checks are the project's own design, not a security certification of servers that pass them.

## Tools & Open Source

- **Speech and word timings in the browser:** In a [November 4 Show HN launch](https://news.ycombinator.com/item?id=50369215), the author of [Phonon on WebGPU](https://github.com/blixt/phonon) released a browser runtime for Gradium's existing speech model that streams audio with word start and end times. The README reports **115× real-time** generation on an M3 Max in the author's benchmark against **31×** for Gradium's browser runtime; these are project-run measurements, not an independent cross-device speed guarantee.
