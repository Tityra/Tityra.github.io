---
title: ComfyUI updates its image and video workflow engine with native LoRA stacks and asset controls
date: 2026-10-15 06:03:38 +0900
kind: Daily brief
summary: ComfyUI's new release changes local workflow handling; Ai2 publishes a climate-model update, LangChain details agent memory, and Graphicle debuts a code-graph tool.
figures:
  - value: "3 km"
    label: Resolution of HiRO-ACEv2 global climate output, according to Ai2
    url: https://huggingface.co/blog/allenai/hiro-acev2
  - value: "1/300th"
    label: HiRO-ACEv2 global simulation cost relative to X-SHiELD, according to Ai2
    url: https://huggingface.co/blog/allenai/hiro-acev2
sources:
  - title: ComfyUI v0.40.0 release
    url: https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.40.0
    outlet: ComfyUI / GitHub
  - title: "HiRO-ACEv2: Simulating extreme weather at 3 km resolution for a fraction of the cost"
    url: https://huggingface.co/blog/allenai/hiro-acev2
    outlet: Ai2 / Hugging Face
  - title: "Context Engineering: How Deep Agents Remember"
    url: https://blog.langchain.com/context-engineering-deep-agents-remember/
    outlet: LangChain
  - title: Graphicle repository
    url: https://github.com/Graphicle-AI/graphicle
    outlet: Graphicle / GitHub
---

## TOP 3

1. [ComfyUI shipped a workflow-engine update with native LoRA stacks and revised asset handling](https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.40.0).
2. [Ai2 released an updated high-resolution climate emulator](https://huggingface.co/blog/allenai/hiro-acev2).
3. [LangChain explained how Deep Agents stores and retrieves context across long runs](https://blog.langchain.com/context-engineering-deep-agents-remember/).

## Models

- **Climate simulation:** [Ai2's October 14 HiRO-ACEv2 announcement](https://huggingface.co/blog/allenai/hiro-acev2) says its updated downscaler generates global **3 km** precipitation, wind and pressure fields; Ai2 estimates a full global simulation costs about **1/300th** as much as X-SHiELD. Those are its own comparisons with a simulation, not measured accuracy against future real-world climates; the team says its current downscaler cannot yet handle warmer-climate or historical-data inputs.

## Agentic AI & Agent Skills

- **Recoverable context:** [LangChain's October 14 Deep Agents guide](https://blog.langchain.com/context-engineering-deep-agents-remember/) describes offloading large tool results to files, summarizing older messages while retaining retrievable originals, loading skills on demand, isolating subagent work and keeping persistent memory in user-controlled files. This is an explanation of its existing harness, not an announcement of a new model or a measured reliability gain.

## Tools & Open Source

- **What changed:** The [ComfyUI v0.40.0 release, published October 14 in Seoul](https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.40.0), adds native LoRA stack-loader nodes, local asset-export API support, standardized output items for 3D nodes and video metadata on ingest. Its release notes also list image-enabled MTP for Qwen3.5, model attention changes, and additional partner nodes for image and video workflows.
  - **Scope and limits:** The release log contains both an earlier change turning assets on by default and a later change returning them to opt-in behind `--enable-assets`; the latter is the documented final state, with a separate Windows standalone exception. The notes enumerate changes but do not provide an end-to-end performance or compatibility evaluation across installations.
- **Code context:** The [Graphicle repository, created October 14](https://github.com/Graphicle-AI/graphicle), describes a local Rust tool combining a repository code graph, searchable project memory and an MCP server for coding agents. Its README says setup changes agent configuration and Git hooks with backups and a disconnect command; the project's speed comparison is one exploratory run, not an independent benchmark.
