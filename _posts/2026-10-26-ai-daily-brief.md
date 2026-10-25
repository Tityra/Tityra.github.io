---
title: llama.cpp fixes dropped rows in four-dimensional tensor quantization
date: 2026-10-26 06:02:21 +0900
kind: Daily brief
summary: A llama.cpp quantization fix corrects incomplete four-dimensional tensors; ThinkRail updates its agent workbench, and a coding-agent memory project reaches Show HN.
sources:
  - title: llama.cpp b11883 release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11883
    outlet: ggml-org / GitHub
  - title: ThinkRail 0.3.0-nightly.6 release
    url: https://github.com/JetBrains/thinkrail/releases/tag/v0.3.0-nightly.6
    outlet: JetBrains / GitHub
  - title: MuscleMemory repository and README
    url: https://github.com/TheWariend/MuscleMemory
    outlet: TheWariend / GitHub
  - title: "Show HN: MuscleMemory – procedural memory for coding agents, proven by tests"
    url: https://news.ycombinator.com/item?id=50235670
    outlet: Hacker News
---

## TOP 3

1. [llama.cpp corrected its four-dimensional tensor quantization path](https://github.com/ggml-org/llama.cpp/releases/tag/b11883).
2. [JetBrains published a ThinkRail nightly with agent-workbench fixes](https://github.com/JetBrains/thinkrail/releases/tag/v0.3.0-nightly.6).
3. [MuscleMemory was presented to the Show HN community](https://news.ycombinator.com/item?id=50235670).

## Agentic AI & Agent Skills

- **Test-gated procedural memory:** An [October 26 Korea-time Show HN submission](https://news.ycombinator.com/item?id=50235670) points to [MuscleMemory](https://github.com/TheWariend/MuscleMemory), whose README describes local capture of coding-agent sessions, promotion of a procedure after separate passing test checks, and user approval before recall. The repository predates the submission; its benchmark savings are project-reported, not independent measurements or evidence of a new release today.

## Tools & Open Source

- **What changed:** The [llama.cpp b11883 release, published October 26 in Korea](https://github.com/ggml-org/llama.cpp/releases/tag/b11883), fixes a row count in `llama-quant`: the old calculation for a four-dimensional tensor omitted its final dimension, so later slices were dropped during quantization. The release uses `ggml_nrows()` to count all rows, and changes expert-tensor detection from a dimension heuristic to tensor names for the MXFP4_MOE path.
  - **Scope of the fix:** The notes also correct the importance-matrix size for four-dimensional tensors and cite MLA projections and convolution kernels as cases where the prior expert heuristic was wrong. They describe a conversion/quantization correctness fix, not an inference-speed gain, and give no measured before-and-after model-quality result.
- **ThinkRail nightly:** [JetBrains' October 25 ThinkRail 0.3.0-nightly.6 prerelease](https://github.com/JetBrains/thinkrail/releases/tag/v0.3.0-nightly.6) lists subagent model/effort display, terminal and chat UI fixes, and support for strict thinking suffixes in model references. It is a nightly build, not a new stable release.
