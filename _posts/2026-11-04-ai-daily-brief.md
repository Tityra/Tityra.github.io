---
title: CyberArena tests security agents in live attack-and-defense matches
date: 2026-11-04 06:03:31 +0900
kind: Daily brief
summary: CyberArena adds live, simultaneous attack and defense to agent evaluation; IBM compares agent harnesses, and a tool-search MCP proxy appears.
figures:
  - value: "466"
    label: Valid agent-versus-agent matches in CyberArena's authors' evaluation
    url: https://huggingface.co/blog/2077AIDataFoundation/cyberarena
  - value: "81.1%"
    label: CUGA task-pass rate in IBM Research's own AppWorld comparison
    url: https://huggingface.co/blog/ibm-research/cuga-harness
sources:
  - title: "CyberArena: Benchmarking AI Agents in Live Symmetric Attack-and-Defense Combat"
    url: https://huggingface.co/blog/2077AIDataFoundation/cyberarena
    outlet: 2077AI / Hugging Face
  - title: "Same Model, Different Harness: CUGA, Hermes, and Deep Agents — When to Pick CUGA?"
    url: https://huggingface.co/blog/ibm-research/cuga-harness
    outlet: IBM Research / Hugging Face
  - title: "Show HN: An MCP proxy that sends 97% fewer tool-definition tokens per request"
    url: https://news.ycombinator.com/item?id=50356916
    outlet: Hacker News
  - title: mcp-toolsearch-proxy repository and README
    url: https://github.com/datolabs-io/mcp-toolsearch-proxy
    outlet: datolabs-io / GitHub
  - title: llama.cpp release b12073
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12073
    outlet: ggml-org / GitHub
  - title: "The 'Astra can read and write weights to improve Qwen' post is misleading"
    url: https://honnibal.dev/blog/astra-read-write-misleading
    outlet: Matthew Honnibal
---

## TOP 3

1. [CyberArena's authors published a live attack-and-defense evaluation for security agents](https://huggingface.co/blog/2077AIDataFoundation/cyberarena).
2. [IBM Research compared three agent harnesses on the same AppWorld tasks](https://huggingface.co/blog/ibm-research/cuga-harness).
3. [A tool-search MCP proxy was presented on Show HN](https://news.ycombinator.com/item?id=50356916).

## Agentic AI & Agent Skills

- **Security agents face an opponent that can patch:** In their [November 3 CyberArena report](https://huggingface.co/blog/2077AIDataFoundation/cyberarena), Bangya Liu and colleagues describe a test in which two agents receive copies of a vulnerable service, attack the other's copy and defend their own across three rounds. The arena checks submitted captures and service health rather than accepting an agent's account of success. In the authors' evaluation, **466 valid matches** among **12 frontier agents** on **40 challenges** produced rankings; they report that GPT-5.6 Sol led and that defense distinguished the strongest agents. This tests model-and-harness entrants in a particular contest, not general cybersecurity competence or performance in production. The authors also identify unverified fix claims and partial patches as recurring failure modes in their audit.
- **Harness choice changes the test outcome:** In a [November 3 comparison](https://huggingface.co/blog/ibm-research/cuga-harness), IBM Research reports that CUGA passed **73 of 90** AppWorld tasks (**81.1%**) with GLM-5.3-flash, versus **42 of 90** for Hermes and **27 of 90** for Deep Agents. IBM says the configurations differed, the benchmark uses consumer apps as a proxy for enterprise workflows, and the runs did not test policy enforcement; these are IBM's own measurements, not an independent ranking of the harnesses.

## MCP & Plug-in

- **Search before loading tool schemas:** In a [November 3 Show HN submission](https://news.ycombinator.com/item?id=50356916), the [mcp-toolsearch-proxy project](https://github.com/datolabs-io/mcp-toolsearch-proxy) presents an MCP server that searches a larger tool catalog, describes selected schemas and separates read-only from write calls. Its **97%** tool-definition-token reduction is the project's benchmark for a specified catalog, not a universal saving.

## Tools & Open Source

- **Vulkan quantization fix:** The [November 3 llama.cpp b12073 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12073) fixes an out-of-bounds lookup for certain NVFP4 scale bytes on its Vulkan path; its notes say models quantized by llama.cpp are unaffected by the problematic byte values.

## Community

- **A distinction in the weight-edit debate:** In a [November 3 critique](https://honnibal.dev/blog/astra-read-write-misleading), spaCy author Matthew Honnibal argues that the earlier weight-space report combines raw-weight interpretation experiments with Qwen editing that uses Python and runs the model on practice problems. This is his reading of the experiment design, not a new measurement of the model's accuracy.
