---
title: Google opens TorchTPU for native PyTorch workloads on its TPUs
date: 2026-10-21 06:26:00 +0900
kind: Daily brief
summary: Google open-sources TorchTPU with PyTorch training and serving integrations; DeepSeek's DeepInfer surfaces, and llama.cpp adds zDNN flash attention.
figures:
  - value: "52%"
    label: Up-to Model Flops Utilization in Google's own TorchTitan Qwen 3 8B training path
    url: https://cloud.google.com/blog/topics/ai-infrastructure/torchtpu-is-now-open-source-run-native-pytorch-on-tpus
sources:
  - title: "TorchTPU is now open source: Run native PyTorch on TPUs"
    url: https://cloud.google.com/blog/topics/ai-infrastructure/torchtpu-is-now-open-source-run-native-pytorch-on-tpus
    outlet: Google Cloud
  - title: TorchTPU repository and README
    url: https://github.com/google-pytorch/torch_tpu
    outlet: Google / GitHub
  - title: DeepInfer repository and README
    url: https://github.com/deepseek-ai/DeepInfer
    outlet: DeepSeek / GitHub
  - title: "DeepInfer: High-performance inference framework for DeepSeek models"
    url: https://news.ycombinator.com/item?id=50163277
    outlet: Hacker News
  - title: llama.cpp b11759 pre-release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11759
    outlet: llama.cpp / GitHub
---

## TOP 3

1. [Google made TorchTPU open source and announced PyTorch training and serving integrations for its TPUs](https://cloud.google.com/blog/topics/ai-infrastructure/torchtpu-is-now-open-source-run-native-pytorch-on-tpus).
2. [DeepInfer's public repository drew developer attention to DeepSeek's inference framework](https://news.ycombinator.com/item?id=50163277).
3. [llama.cpp's latest pre-release added a zDNN flash-attention operation](https://github.com/ggml-org/llama.cpp/releases/tag/b11759).

## Tools & Open Source

- **What opened:** In its [October 21 announcement](https://cloud.google.com/blog/topics/ai-infrastructure/torchtpu-is-now-open-source-run-native-pytorch-on-tpus), Google made [TorchTPU's code](https://github.com/google-pytorch/torch_tpu) public as a native PyTorch backend for Google TPUs, co-developed with Meta's PyTorch team. The backend provides eager-mode debugging and `torch.compile` graph execution; the repository includes ATen kernels, a compilation cache and examples for distributed training and inference. Google's announcement also describes integrations with Hugging Face Transformers and Diffusers, vLLM, SGLang, TorchTitan, VeRL and Ray, plus the related llm-d 1.0 distributed-serving release.
  - **What the evidence supports:** Google reports *up to 52% Model Flops Utilization* for its TorchTitan Qwen 3 8B training path across up to 8,192 Ironwood TPUs. That is Google's workload-specific result, not an independent performance promise for arbitrary PyTorch programs. The [repository's installation guide](https://github.com/google-pytorch/torch_tpu) calls for a TPU VM for its interactive examples; the announcement does not show that existing GPU code can move to TPUs without validation or tuning.
- **DeepSeek's inference code:** An [October 20 Hacker News submission](https://news.ycombinator.com/item?id=50163277) surfaced [DeepInfer](https://github.com/deepseek-ai/DeepInfer). Its Apache-2.0 repository describes offline inference for DeepSeek-V4.1-Flash, including structured outputs and asynchronous scheduling on specified NVIDIA and Ascend hardware; it explicitly says a KV-cache system, prefill/decode disaggregation and replica load balancing are *not* included for a complete service. The repository existed before the submission, so the submission date is not asserted as the code's creation date.
- **zDNN update:** The [llama.cpp b11759 pre-release, published October 20](https://github.com/ggml-org/llama.cpp/releases/tag/b11759), adds a zDNN flash-attention operation and scratch-buffer-pool changes. These are backend changes in a pre-release, not a measured speedup claim.
