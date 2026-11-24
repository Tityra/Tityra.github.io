---
title: OpenAI reports lab binding from GPT-6 protein designs
date: 2026-11-25 06:04:13 +0900
kind: Daily brief
summary: OpenAI reports early lab tests of protein designs; PyTorch details a robot-policy deployment path, and Versine launches an MCP payment interface.
figures:
  - value: "5"
    label: Targets with evidence of binding from GPT-6.2 designs in OpenAI and Onava's lab tests
    url: https://openai.com/index/gpt-6-models-demonstrate-intrinsic-protein-design-capabilities/
  - value: "4%"
    label: Distance from the fastest TensorRT setup in the PyTorch team's Jetson Orin Nano tests
    url: https://pytorch.org/blog/executorch-tensorrt-pytorch-robot-policies-at-nvidia-tensorrt-speed/
sources:
  - title: GPT-6 models demonstrate intrinsic protein-design capabilities
    url: https://openai.com/index/gpt-6-models-demonstrate-intrinsic-protein-design-capabilities/
    outlet: OpenAI
  - title: "ExecuTorch-TensorRT: PyTorch Robot Policies at NVIDIA TensorRT Speed"
    url: https://pytorch.org/blog/executorch-tensorrt-pytorch-robot-policies-at-nvidia-tensorrt-speed/
    outlet: PyTorch
  - title: Release b12681
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12681
    outlet: llama.cpp / GitHub
  - title: "Launch HN: Versine (YC F26) – MCP to send and receive money"
    url: https://news.ycombinator.com/item?id=50634426
    outlet: Hacker News / Versine founders
  - title: Versine product and developer overview
    url: https://versine.com/
    outlet: Versine
---

## TOP 3

1. [OpenAI reported laboratory binding](https://openai.com/index/gpt-6-models-demonstrate-intrinsic-protein-design-capabilities/) from proteins designed with its general-purpose models.
2. [PyTorch described a TensorRT-to-ExecuTorch path](https://pytorch.org/blog/executorch-tensorrt-pytorch-robot-policies-at-nvidia-tensorrt-speed/) for deploying robot policies without libtorch.
3. [Versine's founders launched an MCP payment interface](https://news.ycombinator.com/item?id=50634426) on Hacker News.

## Models

- **Protein design with general-purpose models:** In its [November 24 publication](https://openai.com/index/gpt-6-models-demonstrate-intrinsic-protein-design-capabilities/), OpenAI says its GPT-6 models generated protein structures and sequences using reasoning and general-purpose code rather than specialized biology models for the generation step. In experiments with Onava, proteins based on GPT-6.2 designs showed evidence of binding across **five targets**; redesigned antibodies also retained binding, according to the collaborators. This is a laboratory research result, not a released therapeutic or a general-purpose protein-design API.
  - **The boundary of the result:** OpenAI says specialized structure-prediction models still filtered candidate designs, and its models lag specialized tools at predicting a complete protein structure from sequence. The experiments do not establish end-to-end, zero-shot minibinder design without specialized models; binding alone does not demonstrate specificity, stability, biological activity or clinical efficacy.

## MCP & Plug-in

- **Payments exposed to agents:** In their [November 24 Launch HN post](https://news.ycombinator.com/item?id=50634426), Versine's founders introduced an MCP interface for requesting and sending money through a wallet. Its [product page](https://versine.com/) describes passkey approval and user-set standing permissions, alongside a REST API and webhooks; these are the company's descriptions, not an independent security or regulatory assessment.

## Tools & Open Source

- **Robot-policy deployment:** In a [November 24 technical post](https://pytorch.org/blog/executorch-tensorrt-pytorch-robot-policies-at-nvidia-tensorrt-speed/), the PyTorch and NVIDIA teams describe compiling with Torch-TensorRT 2.15 into an ExecuTorch 1.6 program that runs without libtorch, with CUDA fallback for unsupported TensorRT operations. On their Jetson Orin Nano tests, the result came within **4%** of their fastest TensorRT setup in speed and memory; that is their measured configuration, not a universal deployment guarantee.
- **Vulkan state-scan support:** The [November 24 llama.cpp b12681 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12681) adds support for state size 96 in its Vulkan `ssm_scan` path. The release notes do not report a throughput comparison.
