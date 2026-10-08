---
title: LightOn released OCR models that transcribe pages and label their layout
date: 2026-10-09 06:02:50 +0900
kind: Daily brief
summary: LightOn released open OCR models with page-region grounding; Anthropic revised its usage rules, and PyTorch described session-aware agent inference and a native Spyre device.
figures:
  - value: "86.3"
    label: LightOnOCR-3-4B overall olmOCR-Bench score in LightOn's own evaluation
    url: https://huggingface.co/blog/lightonai/lightonocr-3
sources:
  - title: "LightOnOCR-3: High-Performance OCR and Layout Extraction in One Model"
    url: https://huggingface.co/blog/lightonai/lightonocr-3
    outlet: LightOn / Hugging Face
  - title: 2026 Usage Policy update
    url: https://www.anthropic.com/news/2026-usage-policy-update
    outlet: Anthropic
  - title: Session-Aware Agentic Inference with NVIDIA Dynamo
    url: https://pytorch.org/blog/session-aware-agentic-inference-with-nvidia-dynamo/
    outlet: PyTorch / NVIDIA
  - title: Introducing the Anthropic Cyber Mission
    url: https://www.anthropic.com/news/anthropic-cyber-mission
    outlet: Anthropic
  - title: Building Spyre as a Native PyTorch Device
    url: https://pytorch.org/blog/building-spyre-as-a-native-pytorch-device/
    outlet: PyTorch / IBM
---

## TOP 3

1. [LightOn released LightOnOCR-3 with transcription and document-layout grounding](https://huggingface.co/blog/lightonai/lightonocr-3).
2. [Anthropic published a revised Usage Policy that takes effect in November](https://www.anthropic.com/news/2026-usage-policy-update).
3. [PyTorch detailed NVIDIA Dynamo's session-aware path for serving agent workloads](https://pytorch.org/blog/session-aware-agentic-inference-with-nvidia-dynamo/).

## Models

- **What LightOn released:** In its [October 8 announcement](https://huggingface.co/blog/lightonai/lightonocr-3), LightOn presents three downloadable LightOnOCR-3 models—0.8B, 1B and 4B parameters—under Apache 2.0. An empty prompt retains page transcription; a `grounding` prompt adds labeled region boxes, image descriptions and chart data as tables. The smaller and larger variants use a Qwen3.5 vision-language architecture, while the 1B variant retains the preceding architecture. This gives document-processing builders a single model interface for text and layout rather than requiring separate extraction and segmentation stages.
  - **Evidence and limits:** LightOn reports an 86.3 overall olmOCR-Bench score for its 4B model and a 75.1 five-category ParseBench score; those are its evaluations, not independently replicated results here. The comparison table shows Infinity Parser Pro ahead on olmOCR-Bench overall, and LightOn notes that its prior model's overall score excludes a category counted for the newer models. Bounding boxes are normalized coordinates, not a guarantee that every chart or region will be extracted correctly on a new document collection.
- **Claude use rules:** [Anthropic's October 8 policy update](https://www.anthropic.com/news/2026-usage-policy-update) takes effect November 12. It consolidates prohibitions on deceptive campaigns, removes a blanket ban on personalized political targeting while retaining bans on deception and privacy misuse, and adds operator-stop and safe-state requirements for models controlling potentially injurious hardware; Anthropic says most revisions clarify existing enforcement.

## Tools & Open Source

- **Agent inference:** In an [October 8 technical post](https://pytorch.org/blog/session-aware-agentic-inference-with-nvidia-dynamo/), PyTorch and NVIDIA describe how Dynamo associates model requests and subagents with stable session identifiers for tracing, routing and cache decisions. It recognizes headers from Claude Code, Codex and OpenCode, with plugins for other harnesses; the shared-pool KV indexer is described as experimental and the `KvHint` interface as proposed, not generally deployed features.
- **Cyber defense programs:** [Anthropic's October 8 Cyber Mission announcement](https://www.anthropic.com/news/anthropic-cyber-mission) introduces a Critical Infrastructure Defense Program with selected providers and an OSS Scanner offering free recurring vulnerability scans to open-source projects. Anthropic says it is starting with a small provider cohort; this is separate from the Cyber Verification Program reported earlier this week.
- **Spyre integration:** An [October 8 PyTorch/IBM account](https://pytorch.org/blog/building-spyre-as-a-native-pytorch-device/) describes `torch-spyre` mapping PyTorch device identity, allocator storage, streams, events and Inductor compilation onto IBM's inference accelerator. The article explains the integration architecture rather than announcing a new general PyTorch release.
