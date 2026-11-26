---
title: llama.cpp v1.1.0 broadens local model and audio support while changing its batch API
date: 2026-11-27 06:03:06 +0900
kind: Daily brief
summary: llama.cpp ships a broad local-inference update; NVIDIA shares document-parsing training assets, while Hugging Face tests trained agent cooperation and an AMD benchmark dashboard goes live.
figures:
  - value: "9.98M"
    label: Synthetic chart examples in NVIDIA's newly shared Parse training data
    url: https://huggingface.co/blog/nvidia/building-on-nemotron-35-parse-open-data-fine-tunin
  - value: "7.62×"
    label: Parse 3.5 throughput with DFlash2 versus no speculation at concurrency 1 in NVIDIA's H200 test
    url: https://huggingface.co/blog/nvidia/building-on-nemotron-35-parse-open-data-fine-tunin
  - value: "82.3%"
    label: Last-five-update training success in Hugging Face's four-agent experiment
    url: https://huggingface.co/blog/training-swarms
sources:
  - title: llama.cpp v1.1.0 release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/v1.1.0
    outlet: ggml-org / GitHub
  - title: "Building on Nemotron 3.5 Parse: Open Data, Fine-Tuning, and Faster Inference"
    url: https://huggingface.co/blog/nvidia/building-on-nemotron-35-parse-open-data-fine-tunin
    outlet: NVIDIA / Hugging Face
  - title: "Swarms, Flocks, Gangs: How to build, train, and evaluate multi-agent systems"
    url: https://huggingface.co/blog/training-swarms
    outlet: Hugging Face
  - title: Introducing the llama.cpp benchmark dashboard for AMD Ryzen and Radeon
    url: https://huggingface.co/blog/ggml-org/llamacpp-amd-bench
    outlet: ggml-org / Hugging Face
---

## TOP 3

1. [llama.cpp released v1.1.0](https://github.com/ggml-org/llama.cpp/releases/tag/v1.1.0), expanding local model and audio support alongside an API deprecation.
2. [NVIDIA shared training data and a fine-tuning recipe](https://huggingface.co/blog/nvidia/building-on-nemotron-35-parse-open-data-fine-tunin) for its Nemotron Parse document model.
3. [Hugging Face published a reproducible swarm-training example](https://huggingface.co/blog/training-swarms) that tests whether agent cooperation improves with training.

## Agentic AI & Agent Skills

- **Training cooperation rather than adding retries:** In its [November 26 experiment](https://huggingface.co/blog/training-swarms), Hugging Face trains a shared policy for four agents solving a task with private information. It reports training success rising from **6.6% to 82.3%** between the first and last five updates, and **26 of 32** held-out problems solved at checkpoint 75. The article distinguishes those training measurements from held-out token efficiency, which it says it did not retain; the task does not establish an advantage for general-purpose agent work.

## Tools & Open Source

- **A broader local-inference release:** The [November 26 llama.cpp v1.1.0 release](https://github.com/ggml-org/llama.cpp/releases/tag/v1.1.0) adds support for the Inkling 2 family and several other text and vision models, plus audio and speech systems including Kokoro and Kyutai Hibiki. It splits DFlash speculative decoding into separate draft methods, adds token-aware chat parsing and named tool choice, and introduces per-tensor quantization targets by bits per weight or size. For developers integrating the library, its `llama_batch` API is deprecated in favor of `llama_batch_ext` and `llama_process`; deprecation is not removal.
  - **What the notes do not show:** The release lists capabilities and changes but does not establish a universal throughput gain, or that every listed model and backend combination is equally supported. Integrators should distinguish the model-loading additions from the API change.
- **Document parsing data and adaptation:** In its [November 26 technical post](https://huggingface.co/blog/nvidia/building-on-nemotron-35-parse-open-data-fine-tunin), NVIDIA shares synthetic chart, table and multilingual OCR datasets for Nemotron 3.5 Parse, plus a supervised fine-tuning and verifiable-reward training recipe. It reports **9.98M chart examples** and, on its single-H200 BF16 test, **7.62×** throughput with DFlash2 versus Parse 3.5 without speculation at concurrency 1; those are NVIDIA's datasets and measured setup, not a general accuracy or speed guarantee.
- **Inspecting AMD local inference:** In a [November 26 announcement](https://huggingface.co/blog/ggml-org/llamacpp-amd-bench), the llama.cpp team introduces a public dashboard comparing prompt processing and text generation by hardware, model, quantization and build for AMD Ryzen and Radeon. The linked benchmark data and workflow are public; the dashboard's selected workloads are reference tests rather than application-wide performance predictions.
