---
title: Google opens Gemini 4 Carbon to paying developers and Ultra subscribers
date: 2026-11-11 06:03:14 +0900
kind: Daily brief
summary: Gemini 4 Carbon moves beyond restricted access; NVIDIA contributes agent-security infrastructure to CNCF, and Chrome's team presents coding-agent guidance for modern web APIs.
figures:
  - value: "$2 / $10"
    label: Google's introductory Carbon price per million input / output tokens for public API access
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-carbon-now-available/
  - value: "31 seconds"
    label: Crusoe's reported GLM-5.3 workload readiness with NVIDIA Snapshot, as reported by NVIDIA
    url: https://blogs.nvidia.com/blog/open-source-openshell-infrastructure/
sources:
  - title: Gemini 4 Carbon is now available
    url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-carbon-now-available/
    outlet: Google
  - title: NVIDIA Expands Open Source Commitment With OpenShell Donation and New AI Infrastructure
    url: https://blogs.nvidia.com/blog/open-source-openshell-infrastructure/
    outlet: NVIDIA
  - title: Modern Web Guidance repository and README
    url: https://github.com/GoogleChrome/modern-web-guidance
    outlet: GoogleChrome / GitHub
  - title: "Show HN: Get your coding agent off ~2019 JavaScript, onto modern web primitives"
    url: https://news.ycombinator.com/item?id=50443812
    outlet: Hacker News
  - title: Release llm-gemini 0.36
    url: https://simonwillison.net/2026/Nov/10/llm-gemini/
    outlet: Simon Willison
---

## TOP 3

1. [Google expanded Gemini 4 Carbon access beyond its initial cyber-defender program](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-carbon-now-available/).
2. [NVIDIA said it is contributing OpenShell to the CNCF](https://blogs.nvidia.com/blog/open-source-openshell-infrastructure/).
3. [The Chrome team presented Modern Web Guidance for coding agents](https://news.ycombinator.com/item?id=50443812).

## Models

- **A restricted model becomes an API option:** In its [November 10 announcement](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-carbon-now-available/), Google made Gemini 4 Carbon available through the paid Gemini API tier in AI Studio and to enterprises, after an earlier release to selected cybersecurity defenders. It is also rolling out to Google AI Ultra subscribers in the Gemini app, AI Mode in Search and Antigravity; the latter previews a `/swarm` mode for coordinated agents. Google positions Carbon for complex, longer-running coding and research, while recommending Argon for most ordinary software and knowledge work. The public-access introductory API price is **$2 per million input tokens and $10 per million output tokens**, rising to **$4 / $20 after November 30**, according to Google's footnote.
  - **What the source does not establish:** Google's rankings, task-cost comparisons and security results are presented in its own announcement, with some tests conducted by named external partners; they do not establish performance or cost for every developer workload. The public Carbon model and the stronger cyber access through Google's Fairwind Program are distinct access paths, and an Ultra subscription or paid API tier is required for the availability described above.

## Agentic AI & Agent Skills

- **Agent runtime governance moves into CNCF:** In its [November 10 KubeCon announcement](https://blogs.nvidia.com/blog/open-source-openshell-infrastructure/), NVIDIA says it is contributing OpenShell, an agent runtime with deterministic tool and credential controls, to the CNCF as a Sandbox project. NVIDIA also describes work on Google's Agent Substrate for persistent agent environments on Kubernetes and public previews of its Kubernetes Engine and Recipes. Separately, NVIDIA reports that Crusoe reduced a GLM-5.3 workload's readiness time from roughly eight minutes to **31 seconds** with its Snapshot component; that is a partner workload result, not a general startup guarantee.

## Tools & Open Source

- **Web-platform guidance for coding agents:** In a [November 10 Show HN submission](https://news.ycombinator.com/item?id=50443812), the Chrome team shared [Modern Web Guidance](https://github.com/GoogleChrome/modern-web-guidance), a set of agent skills and a CLI for retrieving targeted browser-API, accessibility and compatibility guidance and scanning for legacy patterns. Its README names stewardship from Chrome, Edge, Firefox and MDN teams; the repository describes recommendations and an installation path, not a measured improvement for every coding agent.

## Community

- **A practitioner's first Carbon test:** In his [November 10 release note and hands-on post](https://simonwillison.net/2026/Nov/10/llm-gemini/), Simon Willison says his `llm-gemini` plugin now accesses Carbon and shows a small creative-coding test with Google Antigravity. This is one developer's demonstration, not an independent benchmark of the model's broader coding performance.
