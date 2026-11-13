---
title: llama.cpp and ggml reach v1.0.0 with explicit API compatibility rules
date: 2026-11-14 06:03:03 +0900
kind: Daily brief
summary: llama.cpp and ggml formalize versioning for downstream integrators; LangChain announces new funding, and Ai2 publishes a benchmark for mistaken user assumptions.
figures:
  - value: "150+"
    label: Architecture variants supported by llama.cpp, according to its maintainers
    url: https://huggingface.co/blog/ggml-org/llama-cpp-v1
  - value: "8,115"
    label: Questions in Ai2's XYBench dataset, according to its authors
    url: https://huggingface.co/blog/allenai/xybench
sources:
  - title: "v1.0.0 release notes"
    url: https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0
    outlet: ggml-org / GitHub
  - title: "llama.cpp v1.0.0 : A stronger foundation for the local AI ecosystem"
    url: https://huggingface.co/blog/ggml-org/llama-cpp-v1
    outlet: ggml-org / Hugging Face
  - title: "LangChain Raises $300M Series C at $3B Valuation"
    url: https://www.langchain.com/blog/series-c
    outlet: LangChain
  - title: "XYBench: Helping with the problem behind the question"
    url: https://huggingface.co/blog/allenai/xybench
    outlet: Ai2 / Hugging Face
---

## TOP 3

1. [llama.cpp published v1.0.0 and set compatibility rules for its public library API](https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0).
2. [LangChain announced a new financing round for its agent platform](https://www.langchain.com/blog/series-c).
3. [Ai2 released XYBench to test whether assistants address a user's underlying problem](https://huggingface.co/blog/allenai/xybench).

## Agentic AI & Agent Skills

- **Agent-platform financing:** In its [November 13 Series C announcement](https://www.langchain.com/blog/series-c), LangChain says it raised **$300 million at a $3 billion valuation**. The company describes LangSmith's runtime, evaluation and governance products and says more than **7,000 organizations** use the platform; these adoption figures are LangChain's own account, not an independently audited measure or a separate product launch.

## Tools & Open Source

- **A version boundary for local inference:** The [November 13 llama.cpp v1.0.0 release](https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0) removes deprecated public C APIs, promotes the NextN/speculative API to `llama.h`, and updates ggml to v1.0.0. Its notes also list FP8 KV caches, an MoE expert cache that can use host memory, new model-architecture support, a speech endpoint and server security fixes. For developers embedding the libraries, the [maintainers' November 13 explanation](https://huggingface.co/blog/ggml-org/llama-cpp-v1) is the lasting change: public C API breaks will carry major-version bumps, backward-compatible additions minor bumps and fixes without API changes patch bumps.
  - **What the sources do not establish:** The release notes enumerate changes but give no measured speedup or universal migration cost for existing integrations. The maintainer post describes versioning from this release forward; a v1.0.0 label is not a promise that every downstream integration already works without changes.
- **Testing for the problem behind a question:** In its [November 13 XYBench release](https://huggingface.co/blog/allenai/xybench), Ai2 describes **8,115 questions** intended to test whether assistants recognize a mistaken proposed approach and redirect to the underlying goal. The authors say their tested models often offered a solution but remained focused on the user's original approach; this is the authors' evaluation, not a general score for all assistants.
