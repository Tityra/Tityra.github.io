---
title: Z.ai introduces looped GLM-5.4 while its API and open weights remain pending
date: 2026-11-24 06:03:43 +0900
kind: Daily brief
summary: Z.ai details a looped flagship model; Google adds server-side file slicing to the Gemini API, and Ai2 releases a robotics tracking benchmark.
figures:
  - value: "28"
    label: GLM-5 base-model layers looped by Z.ai in GLM-5.4
    url: https://z.ai/blog/glm-5.4
  - value: "307"
    label: Human-annotated videos in Ai2's RoboTrack-Bench, according to Ai2
    url: https://huggingface.co/blog/allenai/robotrack
sources:
  - title: "GLM-5.4: Toward Generalized Coding with Our First Loop Transformer"
    url: https://z.ai/blog/glm-5.4
    outlet: Z.ai
  - title: Introducing file slicing controls in the Gemini API
    url: https://blog.google/innovation-and-ai/technology/developers-tools/file-slicing-controls/
    outlet: Google
  - title: How to build and maintain an agentic evaluation
    url: https://huggingface.co/blog/agentic-evals
    outlet: Hugging Face
  - title: "Show HN: Second Brain – One Memory Shared by Claude, ChatGPT and Cursor via MCP"
    url: https://news.ycombinator.com/item?id=50615312
    outlet: Hacker News
  - title: Second Brain repository and README
    url: https://github.com/bhushan/getsecondbrain.io
    outlet: bhushan / GitHub
  - title: "RoboTrack: Point tracking for real-world robotic manipulation"
    url: https://huggingface.co/blog/allenai/robotrack
    outlet: Ai2 / Hugging Face
---

## TOP 3

1. [Z.ai introduced GLM-5.4](https://z.ai/blog/glm-5.4), its first flagship model built on a looped transformer.
2. [Google added server-side file slicing to the Gemini API](https://blog.google/innovation-and-ai/technology/developers-tools/file-slicing-controls/).
3. [Ai2 released RoboTrack](https://huggingface.co/blog/allenai/robotrack), a robotics point-tracking benchmark, training data and models.

## Models

- **A second pass through shared layers:** In its [November 23 announcement](https://z.ai/blog/glm-5.4), Z.ai says GLM-5.4 runs **28 shared layers twice** rather than adding a separate set of weights for the extra pass. The company describes per-token gates to control updates between passes, a hybrid KV cache to limit the added memory cost, and reuse of sparse-attention indices. It says the model is available through Z.ai Chat, ZCode and its Coding Plan.
  - **What is not released:** The announcement lists the API as coming soon and says open weights are planned after safety hardening. Z.ai reports gains from its own controlled experiments and acknowledges that the model can spend too long in "marathon thinking" loops; the post does not provide open weights or an independently reproduced comparison for GLM-5.4.

## Agentic AI & Agent Skills

- **How to audit agent evaluations:** In a [November 23 guide](https://huggingface.co/blog/agentic-evals), Hugging Face traces an agentic benchmark from task definition and harness through rollouts, verification and traces, explaining how changes to the surrounding software can change a score. This is guidance on evaluation practice, not a new benchmark result.

## MCP & Plug-in

- **Shared notes across MCP clients:** A maker [presented Second Brain on Show HN on November 23](https://news.ycombinator.com/item?id=50615312). Its [AGPL-licensed repository](https://github.com/bhushan/getsecondbrain.io) describes a remote MCP server with OAuth, linked Markdown notes, search, revisions and app-attributed writes; the README also documents self-hosting. The presentation and repository describe the service, not independent evidence of its security.

## Tools & Open Source

- **Inspect part of a file in the Gemini API:** In its [November 23 announcement](https://blog.google/innovation-and-ai/technology/developers-tools/file-slicing-controls/), Google says developers can upload supported PDFs, Office documents, audio and video, then specify pages, spreadsheet ranges or media segments for server-side inspection. Google says billing applies to the parts inspected rather than the whole file; the post describes an API capability, not a measured saving across customer workloads.
- **Tracking points through robot manipulation:** In its [November 23 release write-up](https://huggingface.co/blog/allenai/robotrack), Ai2 introduces RoboTrack-Bench with **307 human-annotated videos**, a synthetic training dataset and two point-tracking models. Ai2 says its models improve on their respective baselines in its evaluations and describes a pipette-handling robot demonstration; these are the team's results, not an independent validation of general-purpose robot reliability.
