---
title: NVIDIA releases Nemotron 3.5 models for multimodal retrieval and document parsing
date: 2026-10-22 06:05:17 +0900
kind: Daily brief
summary: NVIDIA introduces embedding, reranking and parsing models for agent retrieval; IBM updates Granite Speech, while a mobile agent and a local MCP memory tool surface.
figures:
  - value: "≈14%"
    label: Reduction in agent inference tokens per query reported by NVIDIA with its 8B embed model plus reranker
    url: https://huggingface.co/blog/nvidia/nemotron-retriever-world-class-agentic-retrieval
  - value: "7.3 s"
    label: Per-step time measured by Opposable for its on-device agent on a Mac M2 CPU
    url: https://getopposable.com/blog/computer-use-on-the-phone
sources:
  - title: "NVIDIA Nemotron 3.5 Embed, Rerank, and Parse: Advancing Agents with World-Class Retrieval Models"
    url: https://huggingface.co/blog/nvidia/nemotron-retriever-world-class-agentic-retrieval
    outlet: NVIDIA / Hugging Face
  - title: "Granite Speech 5.0: Transcribe, Translate, and Attribute more Accurately and Faster"
    url: https://huggingface.co/blog/ibm-granite/granite-speech-5
    outlet: IBM / Hugging Face
  - title: "Computer use on the phone itself: a 2B model that operates Android apps"
    url: https://getopposable.com/blog/computer-use-on-the-phone
    outlet: Opposable
  - title: "Show HN: Renor – private memory for coding agents, shared across tools over MCP"
    url: https://news.ycombinator.com/item?id=50186146
    outlet: Hacker News
  - title: Renor repository and README
    url: https://github.com/patrickpassosb/renor-engine
    outlet: Renor / GitHub
---

## TOP 3

1. [NVIDIA introduced Nemotron 3.5 embedding, reranking and parsing models for agent retrieval](https://huggingface.co/blog/nvidia/nemotron-retriever-world-class-agentic-retrieval).
2. [IBM refreshed its Granite Speech collection with a new speech model and two revised models](https://huggingface.co/blog/ibm-granite/granite-speech-5).
3. [Opposable described a phone-based Android agent using a local screen model](https://getopposable.com/blog/computer-use-on-the-phone).

## Models

- **What NVIDIA released:** In its [October 21 announcement](https://huggingface.co/blog/nvidia/nemotron-retriever-world-class-agentic-retrieval), NVIDIA introduced Nemotron 3.5 Embed models for text-and-image document retrieval, an 8B reranker to reorder results, and a 631M-parameter Parse model for extracting document content. The embedding variants include 8B and 1B BF16 models and a 1B NVFP4 option. This is a retrieval pipeline for the evidence entering an agent's context, not a new general-purpose chat model.
  - **What its measurements mean:** Holding the agent, tools, task set, corpus and execution policy fixed while changing retrieval configuration, NVIDIA reports approximately **14% fewer agent inference tokens per query** when adding its reranker to the 8B embed model, with improved retrieval accuracy. It also reports a ViDoRe v3.1 dense-retrieval score of **61.17 nDCG@10** for the 8B model. These are NVIDIA's selected evaluations, not independent evidence of cost savings or answer quality on a reader's own documents; the post does not establish that the gains transfer to every corpus or deployment.
- **Speech releases:** IBM's [October 21 Granite Speech update](https://huggingface.co/blog/ibm-granite/granite-speech-5) introduces `granite-speech-5.0-2b` for multilingual transcription and translation and revises its 470M Turbo CTC and 4.1 2B Plus models for multilingual transcription and speaker attribution, respectively. IBM says the models are Apache-2.0 licensed; its speed and error-rate comparisons are the company's own tests.

## Agentic AI & Agent Skills

- **Local phone operation:** In an [October 21 technical post](https://getopposable.com/blog/computer-use-on-the-phone), Opposable describes an Android accessibility-based agent that can use a quantized GUI-Owl 1.5 2B screen model on-device or connect to a larger remote agent. Its reported **7.3-second** step is measured on a Mac M2 CPU, not end-to-end speed on a phone; the post says the on-device model is weaker on unfamiliar apps and falls back to cloud agents when connected.

## MCP & Plug-in

- **Local agent memory:** An [October 21 Show HN submission](https://news.ycombinator.com/item?id=50186146) presented [Renor's self-hosted repository](https://github.com/patrickpassosb/renor-engine), which stores coding-agent notes as Markdown and exposes recall across clients through MCP. Its README says the default search has no semantic embeddings unless a provider is configured; the submission dates the public presentation, not the repository's creation.
