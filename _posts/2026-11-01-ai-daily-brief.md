---
title: A Codex agent completes a peaceful Factorio run, but struggles with late-game logistics
date: 2026-11-01 06:02:36 +0900
kind: Daily brief
summary: Ryan Madden documents a completed agent-driven Factorio run; a boot-sector language model and a Gemma 4 image-handling fix also surfaced.
figures:
  - value: "13.5 hours"
    label: Peaceful Factorio game time in Ryan Madden's GPT-5.6 Sol experiment
    url: https://ryanmadden.net/gpt-56-beats-factorio/
  - value: "510 bytes"
    label: Boot-sector inference engine size stated by bootgpt's author
    url: https://github.com/kerlenton/bootgpt
sources:
  - title: GPT-5.6 Sol can beat Factorio
    url: https://ryanmadden.net/gpt-56-beats-factorio/
    outlet: Ryan Madden
  - title: "Show HN: A language model that lives in a boot sector"
    url: https://news.ycombinator.com/item?id=50315782
    outlet: Hacker News
  - title: bootgpt repository and README
    url: https://github.com/kerlenton/bootgpt
    outlet: kerlenton / GitHub
  - title: llama.cpp release b12021
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b12021
    outlet: ggml-org / GitHub
---

## TOP 3

1. [Ryan Madden reported a completed Codex-driven peaceful Factorio run](https://ryanmadden.net/gpt-56-beats-factorio/).
2. [A tiny boot-sector language model was presented on Show HN](https://news.ycombinator.com/item?id=50315782).
3. [llama.cpp changed how it resizes Gemma 4 images](https://github.com/ggml-org/llama.cpp/releases/tag/b12021).

## Agentic AI & Agent Skills

- **A completed run, not an unassisted one:** In his [October 31 account](https://ryanmadden.net/gpt-56-beats-factorio/), Ryan Madden says GPT-5.6 Sol, running in Codex at low thinking level, completed a peaceful Factorio game in **13.5 hours of game time**. A Python game-management library let the agent act programmatically while enforcing player reach and fog-of-war restrictions; Madden provides a timelapse and a production chart.
  - **Where the run strained:** Madden says the agent did not connect some late-game production systems and instead repeatedly carried supplies between factory areas to reach the rocket launch. He compares this with his earlier GPT-5.5 attempt, which failed to use transport belts. The account describes one peaceful run with this game manager; it does not establish performance against hostile enemies, across repeated runs, or without that interface.

## Tools & Open Source

- **Inference from a boot sector:** In an [October 31 Show HN presentation](https://news.ycombinator.com/item?id=50315782), the author of [bootgpt](https://github.com/kerlenton/bootgpt) describes a **510-byte** x86 boot-sector inference engine that loads a small int8 character model from subsequent disk sectors and generates fictional Linux boot logs. The README identifies it as a narrowly trained demonstration, not a general conversational model.
- **Gemma image preprocessing:** The [October 31 llama.cpp b12021 release](https://github.com/ggml-org/llama.cpp/releases/tag/b12021) changes multimodal image resizing for Gemma 4 to remove letterbox padding. Its release note describes the preprocessing change, not a measured improvement in vision accuracy.
