---
title: Agweb updates its visible WebKit browser for coding agents
date: 2026-11-15 06:03:34 +0900
kind: Daily brief
summary: Agweb's new release refines a shared visible browser for agents; Aris extends voice support to older macOS versions, and a small DeepSeek V3 reimplementation ships with a checkpoint.
figures:
  - value: "190"
    label: Lines of JAX in Vaibhaav Tiwari's DeepSeek V3 reimplementation, according to its README
    url: https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax
  - value: "36.2M"
    label: Parameters in Tiwari's small trained reimplementation, according to its release notes
    url: https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax/releases/tag/v1.0
sources:
  - title: Agweb v0.2.0 release
    url: https://github.com/paul-nameless/agweb/releases/tag/v0.2.0
    outlet: Agweb / GitHub
  - title: Agweb repository and README
    url: https://github.com/paul-nameless/agweb
    outlet: Agweb / GitHub
  - title: "Show HN: Agweb – a browser for agents that stays out of your way"
    url: https://news.ycombinator.com/item?id=50497147
    outlet: Hacker News
  - title: Aris 1.2 release
    url: https://github.com/LumenJSN/Aris/releases/tag/v1.2.0
    outlet: Aris / GitHub
  - title: DeepSeek V3 in pure JAX repository and README
    url: https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax
    outlet: Vaibhaav Tiwari / GitHub
  - title: "v1.0: trained checkpoint and data"
    url: https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax/releases/tag/v1.0
    outlet: Vaibhaav Tiwari / GitHub
  - title: "Show HN: DeepSeek V3 in ~200 lines of pure Jax"
    url: https://news.ycombinator.com/item?id=50497589
    outlet: Hacker News
---

## TOP 3

1. [Agweb's maker presented a visible browser for coding agents](https://news.ycombinator.com/item?id=50497147) after [updating its release](https://github.com/paul-nameless/agweb/releases/tag/v0.2.0).
2. [Aris extended voice interaction and dictation to older macOS versions](https://github.com/LumenJSN/Aris/releases/tag/v1.2.0).
3. [A small DeepSeek V3 reimplementation published its trained checkpoint and data](https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax/releases/tag/v1.0).

## Agentic AI & Agent Skills

- **Voice on older Macs:** The [November 14 Aris 1.2 release](https://github.com/LumenJSN/Aris/releases/tag/v1.2.0) enables talking, wake-word use and dictation on macOS 14 and 15 through Apple's older speech-recognition engine; the maintainers say recognition may use Apple's servers where no on-device model is available, and dictation polishing still requires macOS 26.

## Tools & Open Source

- **A browser an agent can drive without taking focus:** The maker [presented Agweb on November 14](https://news.ycombinator.com/item?id=50497147) as a macOS WebKit browser whose CLI lets several coding agents work in separate tab groups while a person watches a shared dashboard. Its [README](https://github.com/paul-nameless/agweb) describes persistent named profiles, suspended idle tabs and visual inspection rather than a headless-only session. The [v0.2.0 release, published November 13 UTC](https://github.com/paul-nameless/agweb/releases/tag/v0.2.0), adds configurable ad and tracker blocking and improves waits, page text and redirect reporting. The release requires macOS 26 or later; neither the notes nor the README establishes that the author's resource-use comparisons generalize across machines or that WebKit supplies Chrome's CDP interface.
- **An educational model implementation, not new DeepSeek weights:** In a [November 14 Show HN post](https://news.ycombinator.com/item?id=50497589), Vaibhaav Tiwari shared a [190-line JAX reimplementation](https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax) of several DeepSeek V3 architectural ideas; the [same-day v1.0 release](https://github.com/Vaibhaav-Tiwari/deepseek-v3-jax/releases/tag/v1.0) supplies the trained **36.2M-parameter** checkpoint, tokenized data and logs. It is a small independent training exercise, not the original DeepSeek V3 model.
