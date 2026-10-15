---
title: Meta releases the weights for its multimodal Muse Spark Open model
date: 2026-10-16 06:04:51 +0900
kind: Daily brief
summary: Meta opens Muse Spark weights for agentic coding and multimodal input; NVIDIA and Black Forest Labs release new models, while Anthropic expands external model evaluation.
figures:
  - value: "816B"
    label: Total parameters in Muse Spark Open, according to Meta
    url: https://research.meta.ai/blog/muse-spark-open
  - value: "1M"
    label: Token context window in Muse Spark Open, according to Meta
    url: https://research.meta.ai/blog/muse-spark-open
  - value: "5.6B"
    label: Image-generator parameters in FLUX 3 Image Klein, according to Black Forest Labs
    url: https://bfl.ai/blog/flux-3-image-klein
sources:
  - title: Introducing Muse Spark Open, The Most Capable US Open-Weight Model to Date
    url: https://research.meta.ai/blog/muse-spark-open
    outlet: Meta AI Research
  - title: "Open From Data Center to Desktop: NVIDIA Expands Nemotron Family With Highest Efficiency Super VL and Bolt Models"
    url: https://blogs.nvidia.com/blog/nemotron-3-5-super-vl/
    outlet: NVIDIA
  - title: "FLUX 3 Image Klein"
    url: https://bfl.ai/blog/flux-3-image-klein
    outlet: Black Forest Labs
  - title: An update on independent evaluators
    url: https://www.anthropic.com/news/an-update-on-independent-evaluators
    outlet: Anthropic
---

## TOP 3

1. [Meta released the weights for Muse Spark Open](https://research.meta.ai/blog/muse-spark-open).
2. [NVIDIA introduced Nemotron Super VL and Bolt models for server and local deployment](https://blogs.nvidia.com/blog/nemotron-3-5-super-vl/).
3. [Black Forest Labs released the open-weight FLUX 3 Image Klein](https://bfl.ai/blog/flux-3-image-klein).

## Models

- **What opened:** In its [October 15 announcement](https://research.meta.ai/blog/muse-spark-open), Meta released Muse Spark Open weights for a model built for coding and agentic work. Meta lists **816B total parameters, 42B active parameters and a 1M-token context window**. It accepts text, images, audio and video as input. Weights are downloadable through Hugging Face and other platforms; Meta also lists hosted API providers and inference-engine support, including MLX for a deployment using two Apple M5 Ultra Mac Studios.
  - **What remains qualified:** This is an open-**weight** release under the Muse Model License, whose commercial terms are limited; it is not an unrestricted open-source license. Meta's coding and safety comparisons are its own evaluations. Its announcement says a full evaluation report is still to come and does not establish independent reliability across developers' workflows.
- **Server and edge models:** [NVIDIA's October 15 release](https://blogs.nvidia.com/blog/nemotron-3-5-super-vl/) says Nemotron 3.5 Super VL and Bolt 74B-A9B 24GB are available now; the smaller Bolt E4B 4GB is scheduled for October 23. Its speed, benchmark and deployment comparisons are NVIDIA's claims, not independent tests here.
- **Image generation and editing:** [Black Forest Labs' October 15 announcement](https://bfl.ai/blog/flux-3-image-klein) releases **5.6B-parameter** FLUX 3 Image Klein weights, with base and distilled variants for generation, editing and layout control. The FLUX Kommunity License permits free commercial use only within its stated revenue limit; the quality and speed comparisons on the page are vendor-run.
- **Independent evaluation access:** [Anthropic's October 15 update](https://www.anthropic.com/news/an-update-on-independent-evaluators) says it has onboarded six METR employees with access roughly comparable to its own risk-assessment teams. Anthropic says METR may publish risk findings without its veto, subject to narrow redactions; the findings themselves have not yet been published in this announcement.
