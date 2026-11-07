---
title: llama.cpp adds text-only support for Kimi-K3.1-Pro
date: 2026-11-08 06:04:51 +0900
kind: Daily brief
summary: llama.cpp gains a Kimi-K3.1-Pro text path; a compressed video-and-audio model reaches Show HN, and a new weight-editing tool appears.
figures:
  - value: "24 of 93"
    label: Layers with a lightning indexer in llama.cpp's Kimi-K3.1-Pro release notes
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12180
  - value: "13.7B"
    label: Parameters in Video Rebirth's fl2va HyperFlow H3 Flash transformer
    url: https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash
sources:
  - title: llama.cpp release b12180
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12180
    outlet: ggml-org / GitHub
  - title: HyperFlow H3 Flash repository and README
    url: https://github.com/Video-Rebirth/hyperflow-h3-flash
    outlet: Video Rebirth / GitHub
  - title: HyperFlow H3 Flash model card and license notice
    url: https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash
    outlet: Video Rebirth / Hugging Face
  - title: "Show HN: We compressed a 31B video+audio diffusion model to 14B, 6 steps, INT8"
    url: https://news.ycombinator.com/item?id=50405263
    outlet: Hacker News
  - title: Laplace's Scissors repository and README
    url: https://github.com/Miyamoto-Renya/LaplacesScissors
    outlet: Miyamoto-Renya / GitHub
  - title: "Show HN: Laplace's Scissors – A tool for directly editing LLM weights"
    url: https://news.ycombinator.com/item?id=50406735
    outlet: Hacker News
---

## TOP 3

1. [llama.cpp released a Kimi-K3.1-Pro text-model implementation](https://github.com/ggml-org/llama.cpp/releases/tag/b12180).
2. [Video Rebirth presented its compressed video-and-audio model on Show HN](https://news.ycombinator.com/item?id=50405263).
3. [A new open-source tool for editing model output weights appeared on Show HN](https://news.ycombinator.com/item?id=50406735).

## Models

- **Video and synchronized audio with fewer sampling steps:** In a [November 7 Show HN launch](https://news.ycombinator.com/item?id=50405263), Video Rebirth presented [HyperFlow H3 Flash](https://github.com/Video-Rebirth/hyperflow-h3-flash), a compressed MiniMax-H3 derivative with GGUF and INT8 weights and ComfyUI workflows. Its [model card](https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash) says the fl2va transformer has **13.7B parameters** and defaults to **6 sampling steps**; the authors' speed figures are not independent quality comparisons. The card says the MiniMax H3 Community License does **not** authorize use in the EU, UK, South Korea or US without prior MiniMax authorization.

## Tools & Open Source

- **Kimi's new attention path in a local runtime:** The [November 7 UTC llama.cpp b12180 prerelease](https://github.com/ggml-org/llama.cpp/releases/tag/b12180) adds a converter, graph and hybrid-cache path for the Kimi-K3.1-Pro text checkpoint. Its release notes say **24 of 93 layers** use a lightning indexer; selection uses the existing sparse flash-attention path rather than gathering selected rows. The vision tower and projector are skipped, so this is **text-only** support. The notes report verification on an **8-layer slice** and passing architecture tests, not a full-checkpoint performance or correctness evaluation.
- **Weight edits with protected answers:** A [November 7 Show HN submission](https://news.ycombinator.com/item?id=50406735) links to [Laplace's Scissors](https://github.com/Miyamoto-Renya/LaplacesScissors), a Rust and Triton project that proposes rotations of an LLM's output matrix against expected answers while checking that designated successful generations remain intact. Its README describes GPU validation and checkpoint export; the submission does not establish broader effectiveness across models.
