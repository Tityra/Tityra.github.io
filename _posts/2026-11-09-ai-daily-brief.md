---
title: Recalc puts coding agents and checks into spreadsheet cells
date: 2026-11-09 06:06:23 +0900
kind: Daily brief
summary: Recalc presents a local agent spreadsheet and updates its pi integration; MAPLE's pruned model gets a developer presentation, while CPU-inference claims draw scrutiny.
figures:
  - value: "4.75 GB"
    label: Size of the MAPLE GGUF reported by its author
    url: https://github.com/AmSach/maple
sources:
  - title: "Show HN: Recalc – Spreadsheet where cells can be Claude Code or Codex terminals"
    url: https://news.ycombinator.com/item?id=50413970
    outlet: Hacker News
  - title: Recalc repository and README
    url: https://github.com/sshah03/recalc
    outlet: Recalc / GitHub
  - title: Recalc v0.1.3 release
    url: https://github.com/sshah03/recalc/releases/tag/v0.1.3
    outlet: Recalc / GitHub
  - title: "Show HN: Maple – Run Gemma 4 26B on a 6GB Laptop GPU at 45 TPS"
    url: https://news.ycombinator.com/item?id=50415106
    outlet: Hacker News
  - title: MAPLE pruning repository and README
    url: https://github.com/AmSach/maple
    outlet: MAPLE / GitHub
  - title: MAPLE GGUF model card
    url: https://huggingface.co/AmSach/Gemma-4-26B-A4B-MAPLE-Sub5GB-GGUF
    outlet: MAPLE / Hugging Face
  - title: "Hacker News discussion: Llama-modchip and CPU inference"
    url: https://news.ycombinator.com/item?id=50411961
    outlet: Hacker News
---

## TOP 3

1. [Recalc presented a spreadsheet for running coding agents in cells](https://news.ycombinator.com/item?id=50413970).
2. [MAPLE's author presented a pruned Gemma-derived model for laptop GPUs](https://news.ycombinator.com/item?id=50415106).
3. [Developers debated CPU inference and quantization trade-offs around llama-modchip](https://news.ycombinator.com/item?id=50411961).

## Models

- **A smaller, workload-specific model, not a new base model:** In a [November 8 Show HN presentation](https://news.ycombinator.com/item?id=50415106), MAPLE's author linked a [Gemma-derived GGUF](https://huggingface.co/AmSach/Gemma-4-26B-A4B-MAPLE-Sub5GB-GGUF) and [expert-pruning method](https://github.com/AmSach/maple) aimed at technical tasks on a laptop GPU. The author reports a **4.75 GB** file and **45.4 tokens per second** on an RTX 4050; those are project measurements, not independently established quality or speed across workloads. The model artifact itself was created before this reporting window; the in-window event is its public presentation, not its initial upload.

## Agentic AI & Agent Skills

- **A grid as an agent workspace:** In its [November 8 Show HN presentation](https://news.ycombinator.com/item?id=50413970), Recalc's author introduced a [local spreadsheet](https://github.com/sshah03/recalc) whose cells can contain values, formulas, commands or Claude Code and Codex sessions. Agents can write to a shared board while adjacent command cells rerun checks when their inputs change; the Driver can arrange work on the board, and an MCP server lets external agent sessions interact with it. The [November 8 v0.1.3 release](https://github.com/sshah03/recalc/releases/tag/v0.1.3) adds experimental pi support, updates its ZIP-reading dependency after security advisories and makes runs that end without an answer show an error rather than raw output.
  - **The boundary:** The [project README](https://github.com/sshah03/recalc) calls it an early beta, says Linux support is experimental and explicitly says commands run with the user's permissions rather than in a sandbox. The author's demonstration of a workflow is not an independent evaluation of agent accuracy or a security guarantee.

## Community

- **Discussion, not a release:** In a [November 8 Hacker News thread](https://news.ycombinator.com/item?id=50411961) about llama-modchip, commenters questioned how aggressive quantization affects answer quality and whether CPU performance differs enough from other local runtimes. Some described their own hardware experiences, but these are participant reports rather than independently verified benchmarks.
