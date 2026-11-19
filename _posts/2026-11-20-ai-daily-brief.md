---
title: Google previews on-demand tool retrieval in the Gemini API
date: 2026-11-20 06:06:55 +0900
kind: Daily brief
summary: Google previews deferred tool schemas for Gemini agents and opens Genie 4 to developers; LangChain adds managed tool governance, while Gemini gains Mac computer use.
figures:
  - value: "720p"
    label: Resolution of Genie 4 worlds described in Google's Gemini API announcement
    url: https://blog.google/innovation-and-ai/technology/developers-tools/genie-4-in-gemini-api/
  - value: "3 minutes"
    label: Maximum Genie 3 session per generation in Google's Project Genie update
    url: https://blog.google/innovation-and-ai/models-and-research/google-deepmind/genie-4-now-available-project-genie/
sources:
  - title: Introducing Tool Retrieval in the Gemini API
    url: https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/
    outlet: Google
  - title: Genie 4 is now available
    url: https://blog.google/innovation-and-ai/models-and-research/google-deepmind/genie-4-now-available-project-genie/
    outlet: Google DeepMind / Google
  - title: Genie 4 is now available on the Gemini API.
    url: https://blog.google/innovation-and-ai/technology/developers-tools/genie-4-in-gemini-api/
    outlet: Google
  - title: "LangSmith Tool Gateway: Secure, governed tool use for agents"
    url: https://www.langchain.com/blog/langsmith-tool-gateway
    outlet: LangChain
  - title: Let Gemini tackle repetitive chores on your Mac
    url: https://blog.google/innovation-and-ai/products/gemini-app/computer-use-mac/
    outlet: Google
---

## TOP 3

1. [Google previewed Tool Retrieval](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/) for Gemini agents with large tool libraries.
2. [Google opened Genie 4](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/genie-4-now-available-project-genie/) in Project Genie and through the Gemini API.
3. [LangChain launched LangSmith Tool Gateway](https://www.langchain.com/blog/langsmith-tool-gateway/) in public beta.

## Models

- **Interactive worlds and a developer API:** In its [November 18 Project Genie update](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/genie-4-now-available-project-genie/), Google began rolling out Genie 4 to eligible Google AI Ultra subscribers, with real-time prompt edits and native audio; Genie 3 remains available and now supports sessions of up to **3 minutes per generation**. Its [November 19 API announcement](https://blog.google/innovation-and-ai/technology/developers-tools/genie-4-in-gemini-api/) adds Genie 4 to the Gemini Interactions API and AI Studio, describing **720p worlds at 24fps** with text and reference-image inputs. Those are Google's stated capabilities, not an independent evaluation of world consistency.

## Agentic AI & Agent Skills

- **On-demand schemas, not on-demand permissions:** In its [November 19 preview announcement](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/), Google introduced Tool Retrieval in the Gemini Interactions API. Developers add a `tool_search` tool and mark less-used functions `defer_loading: true`; the model sees their names and descriptions, while the full parameter schemas arrive only when selected. Google says server-side retrieval happens within the same request, including for remote MCP servers; developers with their own registry or permission filter can use client-side retrieval, which adds a search round trip.
  - **What changes—and what is not established:** Google says there is no separate Tool Retrieval charge, but the search tool adds input tokens and loaded schemas are billed as input. It supports Gemini 3.6 and later models. The announcement does not provide an independent latency or accuracy comparison, and it does not claim that schema retrieval itself enforces authorization: applications still have to govern which tools and credentials an agent can use.
- **Background desktop tasks:** Google's [November 19 announcement](https://blog.google/innovation-and-ai/products/gemini-app/computer-use-mac/) says Gemini computer use is rolling out in English in the U.S. for eligible users on Apple Silicon Macs. It works in an isolated background window across apps and websites, with selectable app access, a live preview, pause controls and approval of key actions.

## MCP & Plug-in

- **Managed MCP tool access:** [LangChain's November 19 launch](https://www.langchain.com/blog/langsmith-tool-gateway) puts LangSmith Tool Gateway in public beta. Teams can register MCP servers, publish curated tool kits, apply caller identity and access policies, and inspect tool-call traces; its search mode loads relevant tools from large kits rather than exposing the entire list at once.
