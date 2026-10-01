---
title: Cloudflare released Clef decision models as AI Search reached general availability
date: 2026-10-02 06:00:00 +0900
kind: Daily brief
summary: Cloudflare released open decision models and made AI Search generally available; Ai2 released its Olmo-core 3 MoE training stack.
figures:
  - value: "64k"
    label: Clef context window, according to Cloudflare
    url: https://blog.cloudflare.com/clef-decision-models/
  - value: "10 MiB"
    label: AI Search maximum text-file and PDF size, according to Cloudflare
    url: https://blog.cloudflare.com/ai-search-ga/
  - value: "2.7×"
    label: Olmo-core 3 training throughput versus its earlier stack in Ai2's preliminary test
    url: https://huggingface.co/blog/allenai/olmocore3
sources:
  - title: "Introducing Clef: our open-source decision models, and new RL fine-tuning platform"
    url: https://blog.cloudflare.com/clef-decision-models/
    outlet: Cloudflare
  - title: "AI Search is now generally available"
    url: https://blog.cloudflare.com/ai-search-ga/
    outlet: Cloudflare
  - title: "Introducing Olmo-core 3: Open, scalable training infrastructure for large MoEs"
    url: https://huggingface.co/blog/allenai/olmocore3
    outlet: Ai2 / Hugging Face
  - title: "Cloudflare OS: your company’s agent workspace, managed for you"
    url: https://blog.cloudflare.com/managed-cloudflare-os/
    outlet: Cloudflare
  - title: "Introducing Workers KV Instant — powered by Quicksilver"
    url: https://blog.cloudflare.com/workers-kv-instant/
    outlet: Cloudflare
---

## TOP 3

1. [Cloudflare introduced Clef and Clef-flash](https://blog.cloudflare.com/clef-decision-models/), decision models released with open weights.
2. [Cloudflare made AI Search generally available](https://blog.cloudflare.com/ai-search-ga/).
3. [Ai2 released Olmo-core 3](https://huggingface.co/blog/allenai/olmocore3), its open MoE training infrastructure.

## Models

- **Clef decision models:** [Cloudflare's October 1 announcement](https://blog.cloudflare.com/clef-decision-models/) releases Clef and Clef-flash on Workers AI and publishes their weights under Apache 2.0. Clef returns typed choices with probabilities, supports images and has a 64k context window.
  - Cloudflare says its reinforcement-learning fine-tuning offering begins as a hands-on service; a self-serve platform is planned, not available today. Its performance comparisons are the company's own tests.

## Agentic AI & Agent Skills

- **Managed Cloudflare OS:** [Cloudflare's October 1 update](https://blog.cloudflare.com/managed-cloudflare-os/) opens a waitlist for a fully managed agent workspace; self-deployment from the open-source repository is already available. The update also adds GitHub repository work and expanded Google Workspace connections.

## MCP & Plug-in

Nothing new

## Tools & Open Source

- **AI Search:** [Cloudflare's October 1 general-availability announcement](https://blog.cloudflare.com/ai-search-ga/) adds native image embeddings, OCR for PDFs and a 10 MiB limit for text files and PDFs, up from 4 MiB. Cloudflare says billing starts November 1, 2026, with a free monthly allotment.
- **Olmo-core 3:** [Ai2's October 1 release on Hugging Face](https://huggingface.co/blog/allenai/olmocore3) opens its redesigned mixture-of-experts training stack. In Ai2's preliminary eight-B300-GPU test, training throughput was about 2.7× its earlier implementation; the larger-scale tests measure systems performance, not model quality.
- **Workers KV Instant:** [Cloudflare's October 1 announcement](https://blog.cloudflare.com/workers-kv-instant/) puts a Quicksilver-backed KV mode into private beta for read-heavy configuration workloads. Cloudflare reports faster reads and replication than classic KV, but notes higher storage and write costs.

## Community

Nothing new

## Coverage

- Hacker News and r/MachineLearning were unreachable in the public-feed collection, and live web search was unavailable. This brief uses the opened primary announcements above; community coverage is incomplete.
