---
title: Anthropic describes how it verified a Claude-assisted migration of its Messages API to Rust
date: 2026-11-26 06:03:22 +0900
kind: Daily brief
summary: Anthropic details production-traffic verification of its Rust API migration; a Hugging Face engineer benchmarks agent-guided inference tuning, and IBM Research demonstrates a multilingual farm assistant.
figures:
  - value: "70%"
    label: Less CPU per request for Anthropic's Rust Messages API, according to Anthropic
    url: https://www.anthropic.com/research/migrating-api-to-rust
  - value: "20%"
    label: Reduction in median time to first token for Anthropic's measured Claude Code requests, according to Anthropic
    url: https://www.anthropic.com/research/migrating-api-to-rust
  - value: "190.6 tok/s"
    label: Single-user decode on one RTX PRO 6000 in the author's Inkling 2 Mini test
    url: https://huggingface.co/blog/inkling-2-mini-inference-hillclimb
sources:
  - title: Migrating our Messages API to Rust
    url: https://www.anthropic.com/research/migrating-api-to-rust
    outlet: Anthropic Engineering
  - title: Hill-climbing Inkling 2 Mini inference on one RTX PRO 6000
    url: https://huggingface.co/blog/inkling-2-mini-inference-hillclimb
    outlet: Niels Rogge / Hugging Face
  - title: An Indic Voice Agent with CUGA
    url: https://huggingface.co/blog/ibm-research/an-indic-voice-agent-with-cuga
    outlet: IBM Research / Hugging Face
---

## TOP 3

1. [Anthropic explained its verification process](https://www.anthropic.com/research/migrating-api-to-rust) for moving the Messages API from Python to Rust with Claude-assisted development.
2. [A Hugging Face engineer published an agent-guided inference-tuning experiment](https://huggingface.co/blog/inkling-2-mini-inference-hillclimb) for Inkling 2 Mini on one workstation GPU.
3. [IBM Research demonstrated a multilingual voice agent](https://huggingface.co/blog/ibm-research/an-indic-voice-agent-with-cuga) that answers agricultural questions against a cited handbook.

## Agentic AI & Agent Skills

- **Migration with production as verifier:** In its [November 25 engineering account](https://www.anthropic.com/research/migrating-api-to-rust), Anthropic says Claude drafted the core Rust request path, but tests alone did not establish parity: at one point, about **98%** of tests passed while only about a quarter of sampled production inputs matched. The team shadowed requests against the existing Python API, replayed model output rather than charging or running inference twice, and logged the shape of differences without reading customer prompts or replies. Grouped difference records went to coordinating and worker agents; engineers reviewed fixes, with sandbox checks followed by production shadowing. Anthropic reports about **70% less CPU per request** and about **20% lower median time to first token** in its measured Claude Code traffic after the migration.
  - **What the account does not establish:** The performance numbers describe Anthropic's own deployment and measured traffic, not a general speedup from rewriting any API in Rust. The post describes parity checks and human review, not proof that every possible request behaves identically.
- **Voice agent grounded in a handbook:** In a [November 25 write-up](https://huggingface.co/blog/ibm-research/an-indic-voice-agent-with-cuga), IBM Research describes a CUGA-based farm assistant that transcribes a question, searches an English agricultural handbook, answers aloud in the questioner's language and displays source pages. It is a demonstration of a bounded workflow, not evidence of reliability in field use.

## Tools & Open Source

- **Agent-guided inference tuning:** In his [November 25 experiment](https://huggingface.co/blog/inkling-2-mini-inference-hillclimb), Hugging Face engineer Niels Rogge says an agent tested serving configurations for Inkling 2 Mini on a single RTX PRO 6000, keeping changes only after benchmark and equivalence checks. In his setup, single-user decoding rose from **136 to 190.6 tokens/s** using vLLM nightly with speculative decoding; the post links logs and scripts. These are his hardware- and workload-specific measurements, not a new model release.
