---
title: REA expands agent-assisted reverse engineering across Android and desktop targets
date: 2026-10-12 08:20:23 +0900
kind: Daily brief
summary: REA's new release adds Android inspection and bounded analysis; Rezoom, LLMxRay and llama.cpp also shipped developer-tool updates.
sources:
  - title: REA agents 6.4.0 release
    url: https://github.com/morluto/rea/releases/tag/rea-agents-6.4.0
    outlet: REA / GitHub
  - title: Rezoom v1.2.0 release
    url: https://github.com/BEX-Robotics/rezoom/releases/tag/v1.2.0
    outlet: BEX Robotics / GitHub
  - title: LLMxRay v0.7.1 release
    url: https://github.com/LogneBudo/llmxray/releases/tag/v0.7.1
    outlet: LLMxRay / GitHub
  - title: llama.cpp b11559 release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11559
    outlet: llama.cpp / GitHub
---

## TOP 3

1. [REA broadened its agent-assisted reverse-engineering workflow to Android devices and more bounded analysis paths](https://github.com/morluto/rea/releases/tag/rea-agents-6.4.0).
2. [Rezoom updated its live session list and remote-terminal handoff](https://github.com/BEX-Robotics/rezoom/releases/tag/v1.2.0).
3. [LLMxRay added image-embedding inspection for compatible local models](https://github.com/LogneBudo/llmxray/releases/tag/v0.7.1).

## Agentic AI & Agent Skills

- **What changed:** The [REA agents 6.4.0 release, published October 11](https://github.com/morluto/rea/releases/tag/rea-agents-6.4.0), extends its agent-assisted reverse-engineering tools to Android device inspection, split-APK acquisition, logs, screenshots and app lifecycle actions through ADB. It adds manifest and localized-string decoding with Apktool, and lets an agent browse and decompile selected JEB project units through a locally started MCP server. For larger investigations, the release adds summary-first access to retained evidence, JavaScript graphs, binary layouts and function dossiers rather than loading every payload into an agent's context.
  - **Limits of the release note:** JavaScript source analysis now runs in a separate process with configurable heap and timeout bounds, retaining explicit unknowns when resources run out. The maintainers describe Windows PE DLL and bounded MIPS ELF analysis, but say the NativeAOT parser's Windows-host Ghidra workflow has not been verified on a real Windows host. These are documented capabilities and limits, not an independent measure of analysis accuracy on arbitrary binaries.
- **Session steering:** The [Rezoom v1.2.0 release, published October 11](https://github.com/BEX-Robotics/rezoom/releases/tag/v1.2.0), distinguishes working, finished and idle Claude sessions in its list, exposes agent names for search and resume, and adds a one-click transfer of a running session from another Konsole window into Rezoom. It also describes SSH tabs appearing as chats.

## Tools & Open Source

- **Local embedding inspection:** The [LLMxRay v0.7.1 release, published October 12 in Seoul](https://github.com/LogneBudo/llmxray/releases/tag/v0.7.1), adds image inputs to its embedding playground and similarity calculator when Ollama reports both embedding and vision support. The maintainer says its current image-embedding path depends on embeddinggemma-2 on Ollama's Apple Silicon MLX runtime; text-only models do not show image controls.
- **OpenCL decoding:** The [llama.cpp b11559 release, published October 12 in Seoul](https://github.com/ggml-org/llama.cpp/releases/tag/b11559), enables OpenCL GPU decoding for Gemma-4 E4B and E2B and includes attention and decode-kernel optimizations. The release note does not provide a general performance benchmark for those changes.
