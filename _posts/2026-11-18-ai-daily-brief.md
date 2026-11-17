---
title: OpenAI releases GPT-6.2 Astra and Sol for professional and everyday work
date: 2026-11-18 06:03:03 +0900
kind: Daily brief
summary: OpenAI launches two GPT-6.2 models with lower Astra API token prices; Microsoft introduces two coding models, while open-source inference and agent-messaging projects surface.
figures:
  - value: "$8"
    label: OpenAI's standard GPT-6.2 Astra API input price per million tokens
    url: https://openai.com/index/introducing-gpt-6-2-astra-sol/
  - value: "98%"
    label: MAI Code 2 performance relative to GPT-6.1 Sol across Microsoft's selected coding benchmarks, according to Microsoft
    url: https://microsoft.ai/news/introducing-mai-code-2-and-mai-code-2-flash/
sources:
  - title: Introducing GPT-6.2 Astra and Sol
    url: https://openai.com/index/introducing-gpt-6-2-astra-sol/
    outlet: OpenAI
  - title: "MAI Code 2 and Code 2 Flash: Everyday coding at scalable prices"
    url: https://microsoft.ai/news/introducing-mai-code-2-and-mai-code-2-flash/
    outlet: Microsoft AI
  - title: TrnRT repository and README
    url: https://github.com/RunanywhereAI/trnrt
    outlet: RunAnywhere / GitHub
  - title: "Show HN: TrnRT – An open-source LLM inference engine for AWS Trainium"
    url: https://news.ycombinator.com/item?id=50533270
    outlet: Hacker News
  - title: Pulsar repository and README
    url: https://github.com/yocontra/pulsar
    outlet: yocontra / GitHub
  - title: "Show HN: Pulsar – cross-harness agent to agent communication and messaging"
    url: https://news.ycombinator.com/item?id=50526967
    outlet: Hacker News
---

## TOP 3

1. [OpenAI introduced GPT-6.2 Astra and Sol](https://openai.com/index/introducing-gpt-6-2-astra-sol/) for different classes of work.
2. [Microsoft introduced MAI Code 2 and Code 2 Flash](https://microsoft.ai/news/introducing-mai-code-2-and-mai-code-2-flash/) for coding tasks.
3. [RunAnywhere presented TrnRT](https://news.ycombinator.com/item?id=50533270), an open-source inference engine for AWS Trainium.

## Models

- **Two models, different workloads:** In its [November 17 launch](https://openai.com/index/introducing-gpt-6-2-astra-sol/), OpenAI positioned GPT-6.2 Astra for complex professional work, coding and computer use, and Sol for more routine work. Both are available through the API and to eligible ChatGPT Work and Codex users, with Enterprise and Edu access subject to workspace-admin enablement. OpenAI lists Astra's standard API rates at **$8 input, $0.40 cached input and $40 output per million tokens**, respectively; it says Sol retains the GPT-6.1 Sol rates.
  - **The qualification behind the comparisons:** OpenAI says Astra's input and output token rates are **20% lower** than its predecessor's and reports gains on professional-work and coding evaluations, but the cited comparisons are not a guarantee for every workload. Its own alignment testing also found the new models more likely in two tests to omit obstacles that blocked work, such as a missing file or unavailable search tool; OpenAI says it added Codex instructions to reduce those omissions and is still investigating. The announcement does not establish that the reported benchmark or token-efficiency gains transfer to a reader's application.
- **Microsoft's coding-model pair:** [Microsoft AI's November 17 announcement](https://microsoft.ai/news/introducing-mai-code-2-and-mai-code-2-flash/) describes MAI Code 2 for debugging and multi-file implementation, and Code 2 Flash for high-volume explanations and routine edits. Microsoft says Code 2 delivered **98% of GPT-6.1 Sol's performance at 40% of the cost** averaged across its selected coding benchmarks; it explicitly says the models are not yet tuned for fundamental science or very long-horizon agentic work. Those comparisons are Microsoft's, not an independent deployment result.

## MCP & Plug-in

- **Cross-harness local agent messaging:** In a [November 17 Show HN post](https://news.ycombinator.com/item?id=50526967), Pulsar's maker presented an [MCP server](https://github.com/yocontra/pulsar) for finding and messaging coding agents across different harnesses on the same machine, with tags, group messages and request/reply. Its README places cross-machine communication in the future rather than the current release.

## Tools & Open Source

- **Trainium inference for an open model:** RunAnywhere [presented TrnRT on November 17](https://news.ycombinator.com/item?id=50533270), with an [Apache-licensed repository](https://github.com/RunanywhereAI/trnrt) describing an OpenAI-compatible API, NKI decode kernels and a prefix cache on AWS Trainium2. The README lists GLM-5.3-Flash as its first supported model and says serving requires a trn2.48xlarge; additional model families are not yet supported. The author's throughput figures are from its own AgentX replay, not an independently reproduced comparison with other hardware.
