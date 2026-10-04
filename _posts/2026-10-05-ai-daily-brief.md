---
title: llama.cpp fixed a tool-call parser memory-safety bug as Pi pod tightened credential handling
date: 2026-10-05 06:06:10 +0900
kind: Daily brief
summary: A llama.cpp pre-release fixed a tool-call parser use-after-free; Pi pod changed credential removal and ticket logging, while a local media-search app surfaced on Show HN.
figures:
  - value: "34.6–35.3 s"
    label: Pi pod image lookup before its change, in the maintainer's disposable-droplet test
    url: https://github.com/pi-pod/pipod/pull/49
  - value: "0.33–0.35 s"
    label: Pi pod image lookup after its change, in the same maintainer test
    url: https://github.com/pi-pod/pipod/pull/49
sources:
  - title: "Release b11393 · ggml-org/llama.cpp"
    url: https://github.com/ggml-org/llama.cpp/releases/tag/b11393
    outlet: llama.cpp / GitHub
  - title: "Release v0.1.9 · pi-pod/pipod"
    url: https://github.com/pi-pod/pipod/releases/tag/v0.1.9
    outlet: Pi pod / GitHub
  - title: "Remove credentials from pods, keep tickets out of logs, and check image layers cheaply"
    url: https://github.com/pi-pod/pipod/pull/49
    outlet: Pi pod / GitHub
  - title: "Show HN: AI search for every photo and every frame of video on macOS"
    url: https://news.ycombinator.com/item?id=49952111
    outlet: Hacker News
  - title: "allenv0/SCM: Deep AI search for every photo and every frame of video in any folder on macOS"
    url: https://github.com/allenv0/SCM
    outlet: SCM / GitHub
---

## TOP 3

1. [llama.cpp published a tool-call parser memory-safety fix](https://github.com/ggml-org/llama.cpp/releases/tag/b11393).
2. [Pi pod released changes to credential removal and ticket handling](https://github.com/pi-pod/pipod/releases/tag/v0.1.9).
3. [A local media-search app for macOS surfaced on Show HN](https://news.ycombinator.com/item?id=49952111).

## Agentic AI & Agent Skills

- **Pi pod v0.1.9:** [The October 5 release](https://github.com/pi-pod/pipod/releases/tag/v0.1.9) updates the self-hosted Pi coding-agent sandbox. Its [merged change description](https://github.com/pi-pod/pipod/pull/49) says removing a provider credential now removes its leased copy from running pods, session tickets are stored as digests, and credential-bearing query values are redacted from request logs. The maintainer also reports image lookup falling from 34.6–35.3 s to 0.33–0.35 s in a disposable-droplet test; that is a project test, not a general performance guarantee.

## Tools & Open Source

- **llama.cpp parser fix:** [The October 5 b11393 pre-release](https://github.com/ggml-org/llama.cpp/releases/tag/b11393) clears a stale `current_tool` pointer after a pending tool call is reset. The release notes say a subsequent `TOOL_ID` after `TOOL_CLOSE` could otherwise cause a use-after-free and a second free of the ID buffer. The notes do not establish exploitability; this is a memory-safety fix in a pre-release.
- **SCM / Screen Memories:** [An October 4 Show HN post](https://news.ycombinator.com/item?id=49952111) surfaced a [local-first macOS media-search project](https://github.com/allenv0/SCM). Its README describes vision search over photos and video scenes, separate OCR and Whisper dialogue search, and optional local chat over extracted evidence. These are the project's stated capabilities, not independent test results.

## Coverage

- Window: October 4, 06:00 to October 5, 06:00 Asia/Seoul. Checked and empty today: Models, MCP & Plug-in, Community. The Qwen watchlist URL points to a new blog; the DeepSeek news URL returned a missing-page notice. OpenAI and xAI were blocked, and r/LocalLLaMA was blocked or rate-limited on retry; coverage of those sources is incomplete. The configured extraction gateway was unavailable, so the watchlist was read directly in a browser.
