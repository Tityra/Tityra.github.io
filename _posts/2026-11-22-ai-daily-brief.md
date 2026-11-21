---
title: llama.cpp fixes missing NVFP4 expert scales in Inkling 2 Mini
date: 2026-11-22 06:06:15 +0900
kind: Daily brief
summary: A llama.cpp build corrects Inkling 2 Mini's looped-layer scale handling; LangChain describes its agent-knowledge workflow, and two small AI tools surface on Show HN.
sources:
  - title: Release b12611
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12611
    outlet: llama.cpp / GitHub
  - title: "model : inkling2_loop re-share the loop slots after the scale pass"
    url: https://github.com/ggml-org/llama.cpp/pull/32704
    outlet: llama.cpp / GitHub
  - title: How to build a knowledge factory for AI agents
    url: https://www.langchain.com/blog/knowledge-factory
    outlet: LangChain
  - title: "Show HN: agent-mcts – Monte Carlo tree search on top of Claude Code"
    url: https://news.ycombinator.com/item?id=50589235
    outlet: Hacker News
  - title: agent-mcts repository and README
    url: https://github.com/natsu0529/agent-mcts
    outlet: natsu0529 / GitHub
  - title: "Show HN: Pencil – LLM writes whiteboard lessons as JSON, a browser draws them"
    url: https://news.ycombinator.com/item?id=50592137
    outlet: Hacker News
  - title: Pencil repository and README
    url: https://github.com/VBS2004/pencil
    outlet: VBS2004 / GitHub
---

## TOP 3

1. [llama.cpp corrected Inkling 2 Mini's looped-layer loading](https://github.com/ggml-org/llama.cpp/releases/tag/b12611) for NVFP4 experts.
2. [LangChain described its internal knowledge-factory workflow](https://www.langchain.com/blog/knowledge-factory) for agents.
3. [An independent developer presented agent-mcts](https://news.ycombinator.com/item?id=50589235), a tree-search harness for coding agents.

## Agentic AI & Agent Skills

- **Maintaining reusable agent knowledge:** In a [November 21 account](https://www.langchain.com/blog/knowledge-factory), LangChain's Harrison Chase describes collecting tacit company knowledge, storing stable procedures as skills, and feeding corrections from agent traces and human review back into a curated knowledge base. He says LangChain uses this approach for internal go-to-market and content agents and for LangSmith Engine; the article describes a workflow, not a newly released product or an independent comparison of agent performance.
- **Tree search for coding agents:** In a [November 21 Show HN post](https://news.ycombinator.com/item?id=50589235), the maker presented [agent-mcts](https://github.com/natsu0529/agent-mcts), which branches coding-agent attempts in worktrees and can score them with tests and an optional LLM judge. Its README says the measured tasks so far show no net improvement over the first attempt; Claude Code has been tested, while its Codex adapter has only been tested against a fake binary.

## Tools & Open Source

- **A scale-loading fix for a looped model:** The [November 21 llama.cpp b12611 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12611) moves the sharing of Inkling 2 Mini's looped-layer slots until after optional scale tensors are attached. The [merged change](https://github.com/ggml-org/llama.cpp/pull/32704) explains that later passes through core layers had run NVFP4 experts without their per-expert scales; GGML quantizations were not affected. The release describes a correctness fix, but does not establish independently measured speed or output-quality gains across hardware.
- **Narrated whiteboard lesson prototype:** In a [November 21 Show HN post](https://news.ycombinator.com/item?id=50592137), a developer shared [Pencil](https://github.com/VBS2004/pencil): an LLM produces lesson JSON, a validator checks it, and a browser player draws SVG in sync with speech. The repository calls it a prototype, not a hosted teaching service.
