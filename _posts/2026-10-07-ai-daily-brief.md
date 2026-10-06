---
title: Mistral opened a Large 4 API preview ahead of its promised weight release
date: 2026-10-07 06:03:16 +0900
kind: Daily brief
summary: Mistral previewed Large 4 without yet shipping weights; Google released multimodal EmbeddingGemma 2, and Anthropic expanded verified access for cyber defenders.
figures:
  - value: "1 trillion"
    label: Mistral Large 4 total parameters, according to Mistral
    url: https://mistral.ai/news/mistral-large-4/
  - value: "49 billion"
    label: Mistral Large 4 active parameters, according to Mistral
    url: https://mistral.ai/news/mistral-large-4/
  - value: "740 million"
    label: EmbeddingGemma 2 total parameters, according to Google
    url: https://blog.google/innovation-and-ai/technology/developers-tools/embeddinggemma-2/
sources:
  - title: Introducing Mistral Large 4
    url: https://mistral.ai/news/mistral-large-4/
    outlet: Mistral
  - title: "EmbeddingGemma 2: an open, lightweight multimodal embedding model"
    url: https://blog.google/innovation-and-ai/technology/developers-tools/embeddinggemma-2/
    outlet: Google
  - title: Expanding the Cyber Verification Program
    url: https://www.anthropic.com/news/cyber-verification-program
    outlet: Anthropic
  - title: "Falcon OCR Arabic: 270M Parameters State-of-the-Art Arabic OCR"
    url: https://huggingface.co/blog/tiiuae/falcon-ocr-arabic
    outlet: Technology Innovation Institute / Hugging Face
  - title: EmbeddingGemma 2 discussion
    url: https://news.ycombinator.com/item?id=49980487
    outlet: Hacker News
---

## TOP 3

1. [Mistral made Large 4 available through a preview API while promising weights later](https://mistral.ai/news/mistral-large-4/).
2. [Google released EmbeddingGemma 2 for local cross-modal retrieval](https://blog.google/innovation-and-ai/technology/developers-tools/embeddinggemma-2/).
3. [Anthropic expanded its Cyber Verification Program into tiered access](https://www.anthropic.com/news/cyber-verification-program).

## Models

- **Mistral Large 4 preview:** [Mistral's October 6 announcement](https://mistral.ai/news/mistral-large-4/) says its natively multimodal mixture-of-experts model has 1 trillion total parameters and 49 billion active parameters. Developers can use the public preview API in Mistral Studio now, but the weights are not yet available; Mistral says it will release them by the end of the month after red-teaming with selected partners. The company reports strong coding, cyber, finance and visual-grounding results, including on third-party benchmarks, but the comparative claims in this announcement are its own account rather than independent verification here.
  - **What remains open:** Mistral says more architecture details, additional benchmarks and post-training methods will accompany the weights. This is therefore an API preview, not an open-weight download or a complete technical report. It follows yesterday's Reflection Beam preview, but leads today because the API is usable now and Mistral documents multimodal and enterprise workloads rather than only announcing future artifacts.
- **EmbeddingGemma 2:** [Google's October 6 release](https://blog.google/innovation-and-ai/technology/developers-tools/embeddinggemma-2/) describes a 740-million-parameter model that embeds text, code, images, audio and video into one space under Apache 2.0. Google says the weights are downloadable on Hugging Face and Kaggle, with optional vision and audio encoders; its quality and device-memory comparisons are Google-reported.
- **Falcon OCR Arabic:** [Technology Innovation Institute's October 6 account](https://huggingface.co/blog/tiiuae/falcon-ocr-arabic) describes adapting its 270M-parameter OCR model to Arabic documents with supervised fine-tuning and reinforcement learning. On the institute's own Arabic-document evaluation, it reports 81.9% text accuracy, behind Gemini 3.5 Flash's 84.3%; the page's linked model reference points to the base Falcon-OCR repository, so this post does not establish a separately downloadable Arabic checkpoint.

## Tools & Open Source

- **Cyber access tiers:** [Anthropic's October 6 announcement](https://www.anthropic.com/news/cyber-verification-program) folds Project Glasswing into an expanded Cyber Verification Program with Defense, Red Team and Specialized access, each with different verification and safeguards for security work. Anthropic says qualifying applicants can seek access to Opus, Sonnet and Mythos models with reduced cyber blocking; the program requires verification and is not a general removal of restrictions.

## Community

- **Discussion, not a model evaluation:** In an [October 6 Hacker News thread about EmbeddingGemma 2](https://news.ycombinator.com/item?id=49980487), Simon Willison argues that openly licensed embedding weights provide a fallback if a hosted provider discontinues a model and users would otherwise have to recompute stored vectors. That is a developer's portability concern, not evidence for Google's performance claims.
