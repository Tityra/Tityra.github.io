---
title: Reflection releases Beam, an Apache-licensed open-weight model for coding agents
date: 2026-10-17 06:04:20 +0900
kind: Daily brief
summary: Reflection's Beam weights and serving recipes arrive; NVIDIA details an Indic-language data pipeline, and PS5LM updates its local model server.
figures:
  - value: "501B"
    label: Total parameters in Reflection's Beam model, according to its model card
    url: https://huggingface.co/reflection/Beam-1.0-501B-A23B
  - value: "23B"
    label: Active parameters per token in Beam, according to Reflection
    url: https://huggingface.co/reflection/Beam-1.0-501B-A23B
  - value: "2.8 trillion"
    label: Approximate tokens in NVIDIA's announced, not-yet-released Indic corpus
    url: https://huggingface.co/blog/nvidia/scaling-indic-pretraining
sources:
  - title: "Welcome Beam: a 501B open model you can own, customize, and scale"
    url: https://huggingface.co/blog/reflection-beam
    outlet: Hugging Face / Reflection
  - title: reflection/Beam-1.0-501B-A23B model card
    url: https://huggingface.co/reflection/Beam-1.0-501B-A23B
    outlet: Reflection / Hugging Face
  - title: "Scaling Indic Pretraining: 2.8 Trillion Tokens and an Open Data Generation Pipeline"
    url: https://huggingface.co/blog/nvidia/scaling-indic-pretraining
    outlet: NVIDIA / AI4Bharat
  - title: PS5LM v0.9.0 release
    url: https://github.com/cobanov/PS5LM/releases/tag/v0.9.0
    outlet: PS5LM / GitHub
---

## TOP 3

1. [Reflection released Beam's open weights and deployment recipes](https://huggingface.co/blog/reflection-beam).
2. [NVIDIA and AI4Bharat detailed a forthcoming Indic-language corpus and its generation workflow](https://huggingface.co/blog/nvidia/scaling-indic-pretraining).
3. [PS5LM shipped a redesigned local model-serving app for jailbroken consoles](https://github.com/cobanov/PS5LM/releases/tag/v0.9.0).

## Models

- **What opened:** The [October 16 Beam launch guide](https://huggingface.co/blog/reflection-beam) and [Reflection's model card](https://huggingface.co/reflection/Beam-1.0-501B-A23B) describe an Apache-2.0-licensed, text-only mixture-of-experts model for coding and agentic tool use. It has **501B total parameters, 23B active per token and a 1M-token context window**. Instruction-tuned checkpoints are offered in BF16, FP8 and NVFP4; the guide gives Transformers, vLLM and SGLang serving recipes, plus supervised fine-tuning and reinforcement-learning examples. The weights appeared on the Hub on October 16.
  - **What the release does not establish:** The benchmark table is supplied by the Reflection team, not an independent comparison of production coding workflows. The guide estimates the BF16 checkpoint at about **1 TB** and the NVFP4 variant at about **280 GB**; sparse activation does not make the full checkpoint fit on an ordinary laptop. The model card marks its technical report as forthcoming.

## Tools & Open Source

- **Indic pretraining data, announced rather than shipped:** In its [October 16 account](https://huggingface.co/blog/nvidia/scaling-indic-pretraining), NVIDIA and AI4Bharat describe an approximately **2.8-trillion-token** synthetic corpus across **22 Indian languages**, with native-script and some romanized records, plus a translation, assessment and repair pipeline. The article says the corpus is *releasing soon*; its reported Nemotron evaluation changes compare checkpoints across a training stage that also used natural Indic text, not the isolated effect of this corpus.
- **Local inference on a console:** The [PS5LM v0.9.0 release of October 16](https://github.com/cobanov/PS5LM/releases/tag/v0.9.0) adds a TV-oriented interface, Hugging Face model downloads and decision-model API support to its llama.cpp-based server on a jailbroken PS5. The release requires specific homebrew components and notes that decision models may stop responding after repeated requests; it is not a stock-console installation.
