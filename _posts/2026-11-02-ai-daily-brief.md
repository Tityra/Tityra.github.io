---
title: Heretic 2.0 turns a refusal-removal tool into a general model modifier
date: 2026-11-02 06:02:57 +0900
kind: Daily brief
summary: Heretic's breaking release adds pluggable scoring and model modification; a local MoE offload patch and an expressive small speech model also arrived.
figures:
  - value: "97.3 tok/s"
    label: Qwen3.8-Flash-Next decode in tandem.cpp author's RTX 4090 GSM8K test
    url: https://github.com/ewhacc/tandem.cpp
  - value: "18.2M"
    label: Speech-generation parameters in BlueRose Labs' Silencio-2 model card
    url: https://huggingface.co/BlueRoseLabs/Silencio-2
sources:
  - title: Heretic v2.0.0 release
    url: https://github.com/p-e-w/heretic/releases/tag/v2.0.0
    outlet: p-e-w / GitHub
  - title: Heretic repository and README
    url: https://github.com/p-e-w/heretic
    outlet: p-e-w / GitHub
  - title: tandem.cpp repository and benchmarks
    url: https://github.com/ewhacc/tandem.cpp
    outlet: ewhacc / GitHub
  - title: Silencio-2 model card
    url: https://huggingface.co/BlueRoseLabs/Silencio-2
    outlet: BlueRose Labs / Hugging Face
  - title: Mathematics has changed. Let’s act like it
    url: https://terrytao.wordpress.com/2026/11/01/mathematics-has-changed-lets-act-like-it/
    outlet: Frank Calegari / Terence Tao's blog
---

## TOP 3

1. [Heretic released a breaking update to its model-modification tool](https://github.com/p-e-w/heretic/releases/tag/v2.0.0).
2. [tandem.cpp published a patch for CPU/GPU expert offload](https://github.com/ewhacc/tandem.cpp).
3. [BlueRose Labs published the Silencio-2 speech model](https://huggingface.co/BlueRoseLabs/Silencio-2).

## Models

- **Speech with inline delivery cues:** The [Silencio-2 model card](https://huggingface.co/BlueRoseLabs/Silencio-2), for a repository created October 31 UTC (November 1 in Seoul), describes an English-only fine-tune of Kyutai's Pocket TTS with sound and emotion tags, streaming output and voice cloning. BlueRose Labs lists **18.2M** speech-generation parameters and says its Apple M4 CPU run was about **20×** real time; it cautions that tag strength varies by take and that whispering is less consistent.

## Tools & Open Source

- **A broader tool, with a migration cost:** The [November 1 Heretic 2.0 release](https://github.com/p-e-w/heretic/releases/tag/v2.0.0) adds a generic plugin system, modifier plugins and arbitrary-rank ablation. The [project README](https://github.com/p-e-w/heretic) describes configurable scorers for more than its original default of refusal suppression: examples include reducing sycophancy or formulaic output. The tool modifies model behavior without a training run; it does not ship a newly trained base model.
  - **What changes for existing users:** The release explicitly says Heretic 1.x configuration files are incompatible with 2.0 and that research features were removed. Its notes and README describe capabilities and setup, but do not provide an independent evaluation establishing that these interventions preserve general model performance or safety across models.
- **MoE offload on consumer hardware:** In its [November 1 repository](https://github.com/ewhacc/tandem.cpp), tandem.cpp supplies a patch to llama.cpp that caches frequently used experts on a GPU while computing some missing experts on the CPU. In the author's RTX 4090 GSM8K decode test, Qwen3.8-Flash-Next reached **97.3 tok/s** versus **29.8 tok/s** for the configured llama.cpp baseline; the README targets single-user decode and identifies these as project-run measurements, not a general serving benchmark.

## Community

- **Discussion, not a theorem audit:** In a [November 1 guest essay](https://terrytao.wordpress.com/2026/11/01/mathematics-has-changed-lets-act-like-it/) on Terence Tao's blog, mathematician Frank Calegari argues that AI-generated mathematical work should prompt better attribution, verification and reward for broad research programs. His criticisms of particular papers and claims about AI's mathematical reach are his assessment, not independently established findings of this brief.
