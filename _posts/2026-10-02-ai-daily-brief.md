---
title: Cloudflare opened AI Search to general availability as Ai2 released Olmo-core 3
date: 2026-10-02 00:30:00 +0900
kind: Daily brief
summary: Cloudflare made AI Search generally available and opened a managed agent-workspace waitlist; Ai2 released an open MoE training stack.
figures:
  - value: "2.7×"
    label: Ai2's preliminary Olmo-core 3 throughput versus its earlier implementation on eight B300 GPUs
    url: https://huggingface.co/blog/allenai/olmocore3
  - value: "10 MiB"
    label: Cloudflare AI Search's new maximum PDF and text-file size
    url: https://blog.cloudflare.com/ai-search-ga/
sources:
  - title: "AI Search is now generally available"
    url: https://blog.cloudflare.com/ai-search-ga/
    outlet: Cloudflare
  - title: "Introducing Olmo-core 3: Open, scalable training infrastructure for large MoEs"
    url: https://huggingface.co/blog/allenai/olmocore3
    outlet: Ai2 / Hugging Face
  - title: "Cloudflare OS: your company’s agent workspace, managed for you"
    url: https://blog.cloudflare.com/managed-cloudflare-os/
    outlet: Cloudflare
  - title: "One year later: Sovereign AI and the fight for choice"
    url: https://blog.cloudflare.com/sovereign-ai-choice-one-year-later/
    outlet: Cloudflare
  - title: "We want you to build the next Git platform on Cloudflare"
    url: https://blog.cloudflare.com/next-git-platform-on-cloudflare/
    outlet: Cloudflare
  - title: "Introducing Workers KV Instant — powered by Quicksilver"
    url: https://blog.cloudflare.com/workers-kv-instant/
    outlet: Cloudflare
  - title: "Announcing Cloudflare K2: serverless event streams"
    url: https://blog.cloudflare.com/cloudflare-k2-streams/
    outlet: Cloudflare
  - title: "Introducing Cloudflare Basin: an open, serverless data platform, now generally available"
    url: https://blog.cloudflare.com/cloudflare-basin/
    outlet: Cloudflare
  - title: "5x faster Edge Functions: How we replaced v8 isolates with Firecracker MicroVMs"
    url: https://www.netlify.com/blog/edge-functions-firecracker-microvms/
    outlet: Netlify
---

## TOP 3

1. [Cloudflare made AI Search generally available](https://blog.cloudflare.com/ai-search-ga/), adding native image retrieval and OCR for scanned PDFs.
2. [Ai2 released Olmo-core 3](https://huggingface.co/blog/allenai/olmocore3), an open training framework redesigned for large mixture-of-experts models.
3. [Cloudflare opened the waitlist for fully managed Cloudflare OS](https://blog.cloudflare.com/managed-cloudflare-os/), its organizational agent workspace.

## Models

- **European open models on Workers AI:** [Cloudflare's October 1 announcement](https://blog.cloudflare.com/sovereign-ai-choice-one-year-later/) says users can request access to EuroLLM and Apertus. The post presents these as models coming to Workers AI, not as new model releases.

## Agentic AI & Agent Skills

- **Cloudflare OS:** [Cloudflare's October 1 post](https://blog.cloudflare.com/managed-cloudflare-os/) opens a waitlist for its fully managed agent workspace; the open-source version remains deployable in customers' own accounts. The workspace now connects to existing GitHub repositories for code changes and pull requests, and its Google Workspace integration can research Gmail threads and create drafts.
- **Artifacts for agent workflows:** [Cloudflare's October 1 update](https://blog.cloudflare.com/next-git-platform-on-cloudflare/) says its open-beta Git-backed Artifacts repositories can now trigger Workers Builds and preview deployments, and Workers bindings can create or fork repos and read files. It also announced a competition for agent-oriented Git platforms; Artifacts is available to Workers Paid customers.

## MCP & Plug-in

Nothing new

## Tools & Open Source

- **AI Search GA:** [Cloudflare's October 1 release](https://blog.cloudflare.com/ai-search-ga/) adds native image embeddings, OCR for scanned PDFs and a 10 MiB file limit, up from 4 MiB. Cloudflare says billing begins November 1, 2026, with a free monthly allotment on Workers plans.
- **Olmo-core 3:** [Ai2's October 1 release](https://huggingface.co/blog/allenai/olmocore3/) switches its MoE training stack from weight gathering with FSDP to a DDP-based approach that keeps experts resident on GPUs. In Ai2's preliminary eight-B300 comparison on a 47-billion-parameter MoE, it reports 52,000 versus 19,400 tokens per second per GPU, about 2.7× its earlier stack; its trillion-parameter tests measure systems performance, not model quality.
- **Workers KV Instant:** [Cloudflare's October 1 announcement](https://blog.cloudflare.com/workers-kv-instant/) puts a Quicksilver-backed KV mode into private beta for small, infrequently updated configuration data. Cloudflare reports 1.62 ms p99 reads in its comparison; the mode limits each namespace to one write per second and costs more for storage and writes than classic KV.
- **K2 and Basin:** [Cloudflare launched K2](https://blog.cloudflare.com/cloudflare-k2-streams/) in public beta as a durable event stream backed by R2, with batch consumption and long-term retention; [Basin](https://blog.cloudflare.com/cloudflare-basin/) is now generally available as its Apache Iceberg-based ingestion, catalog and SQL-query platform. These are separate products, with K2 originally built as a buffer for Basin Pipelines.
- **Netlify Edge Functions:** [Netlify's September 30 engineering post](https://www.netlify.com/blog/edge-functions-firecracker-microvms/) says Edge Functions now run in Firecracker MicroVMs on its own edge network instead of a hosted execution service. Netlify reports warm median invocation overhead of roughly 5–6 ms versus 25–40 ms before; the change is live without a migration step.

## Community

Nothing new
