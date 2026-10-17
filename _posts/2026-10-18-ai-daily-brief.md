---
title: DeepSeek updates V4.1 Flash and opens its search and fetch APIs
date: 2026-10-18 06:02:45 +0900
kind: Daily brief
summary: DeepSeek updates its Flash model and exposes search and fetch APIs; llama.cpp adds Hub discovery, and llmspeed surfaces local-inference estimates.
figures:
  - value: "1M"
    label: Token context window specified on DeepSeek's V4.1 Flash 1017 model card
    url: https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017
  - value: "42.3"
    label: Terminal-Bench 4.0 score reported by DeepSeek for V4.1 Flash 1017 in its Claude Code harness
    url: https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017
sources:
  - title: DeepSeek API Change Log
    url: https://api-docs.deepseek.com/updates
    outlet: DeepSeek
  - title: Search & Fetch
    url: https://api-docs.deepseek.com/guides/search
    outlet: DeepSeek
  - title: DeepSeek-V4.1-Flash-1017 model card
    url: https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017
    outlet: DeepSeek / Hugging Face
  - title: llama.cpp b11714 pre-release
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11714
    outlet: llama.cpp / GitHub
  - title: llmspeed repository
    url: https://github.com/nicorobinreal/llmspeed
    outlet: llmspeed / GitHub
  - title: "Show HN: Llmspeed – feel how fast a local LLM runs before you buy the hardware"
    url: https://news.ycombinator.com/item?id=50127979
    outlet: Hacker News
---

## TOP 3

1. [DeepSeek updated V4.1 Flash and opened search and fetch APIs](https://api-docs.deepseek.com/updates).
2. [llama.cpp added model discovery and resumable downloads to its UI](https://github.com/ggml-org/llama.cpp/releases/tag/b11714).
3. [llmspeed was presented as a local-inference hardware comparison tool](https://news.ycombinator.com/item?id=50127979).

## Models

- **What changed:** DeepSeek's [October 17 change log](https://api-docs.deepseek.com/updates) says the `deepseek-flash` API now serves V4.1 Flash 1017 without a change to its calling method or price; the web and app models were updated too. Its [new model card](https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017) provides MIT-licensed weights, a **1M-token** context specification, and prompt-encoding and local-inference references. The same dated change log announces [Search and Fetch APIs](https://api-docs.deepseek.com/guides/search): authenticated endpoints for structured web search results and page content as Markdown, respectively.
  - **What the sources do not establish:** DeepSeek reports a **42.3** Terminal-Bench 4.0 score for the update using a Claude Code harness; this is the company's benchmark table, not an independent finding about production agent reliability. The [Search and Fetch guide](https://api-docs.deepseek.com/guides/search) describes API-key authentication, billing and access-policy failures; opening those endpoints does not mean unauthenticated or universal access to web pages.

## Tools & Open Source

- **Hub models from a local UI:** The [llama.cpp b11714 pre-release of October 17](https://github.com/ggml-org/llama.cpp/releases/tag/b11714) adds a Hugging Face GGUF discovery view, model details and download controls to its UI, along with pause/resume handling and persisted unfinished-download state. The release notes say browsing is gated by an Enable Discover Models setting; this is a pre-release, not a claim that every model is supported.
- **Before buying inference hardware:** In an [October 17 Show HN post](https://news.ycombinator.com/item?id=50127979), llmspeed's developer presented a [static, open-source comparison site](https://github.com/nicorobinreal/llmspeed) that simulates token streaming, startup delay and memory fit across local model and hardware pairings. Its README distinguishes measured, derived and projected estimates and says multi-device configurations are not simulated; the display is a guide, not a benchmark of the reader's machine.
