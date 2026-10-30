---
title: Google reports the first response from an AI accelerator in orbit
date: 2026-10-31 06:04:34 +0900
kind: Daily brief
summary: Google's orbital TPU returned a Gemma-generated response; two Show HN projects exposed unusual model execution and a self-hosted scoring server.
figures:
  - value: "466.6M"
    label: Parameters in nesformer's compiled checkpoint, according to its author
    url: https://github.com/dbreunig/nesformer
  - value: "491"
    label: Questions per second on one RTX 4090 in spinf-serve's own benchmark
    url: https://github.com/spinfinc/spinf-serve
sources:
  - title: We’ve received our first response from the Project Suncatcher prototype satellite.
    url: https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/
    outlet: Google Research
  - title: nesformer repository and README
    url: https://github.com/dbreunig/nesformer
    outlet: dbreunig / GitHub
  - title: "Show HN: A working Nintendo in ~1GB of Qwen weights"
    url: https://news.ycombinator.com/item?id=50306442
    outlet: Hacker News
  - title: spinf-serve repository and README
    url: https://github.com/spinfinc/spinf-serve
    outlet: spinfinc / GitHub
  - title: "Show HN: Spinf-serve – inference server for bulk scoring and decisions"
    url: https://news.ycombinator.com/item?id=50306815
    outlet: Hacker News
---

## TOP 3

1. [Google received a response from its orbital TPU prototype](https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/).
2. [The nesformer project was presented on Show HN](https://news.ycombinator.com/item?id=50306442).
3. [A self-hosted bulk scoring server reached Show HN](https://news.ycombinator.com/item?id=50306815).

## Tools & Open Source

- **What happened in orbit:** In its [October 30 Project Suncatcher update](https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/), Google says it uplinked a prompt during a ground-station pass to a Gemma 4 model running on a data-center-class TPU aboard its prototype satellite and received a generated haiku back. Google also reports powering its host and TPU trays and running early machine-learning tests after the satellite's October 1 launch. This is an inference milestone for the prototype, not an announcement of an orbital AI service.
  - **What remains untested in the announcement:** Google says thermal-stress and radiation-exposure evaluations are still ahead, as is a planned test of interconnected satellites. The returned poem establishes that this prompted workload produced an output; the update does not report sustained throughput, reliability under radiation, or commercial deployment economics.
- **A CPU in model weights:** Presented in an [October 30 Show HN submission](https://news.ycombinator.com/item?id=50306442), [nesformer](https://github.com/dbreunig/nesformer) compiles an NES CPU and memory into a Qwen3.5-shaped checkpoint rather than training the weights; a host program handles video, controls and interrupts. Its author reports matching reference traces for bundled games but says the implementation is slow and only supports NROM cartridges; this is a demonstration, not a new general-purpose model release.
- **One read, many scores:** The [October 30 Show HN submission](https://news.ycombinator.com/item?id=50306815) presents [spinf-serve](https://github.com/spinfinc/spinf-serve), an Apache-licensed server that branches multiple classification questions off one read of the input and returns option probabilities through an OpenAI-compatible API. In the project's own RTX 4090 comparison it reports **491 questions per second** against **200** for its configured vLLM baseline; those are author-run workload-specific measurements, not an independent serving benchmark.
