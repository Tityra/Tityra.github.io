---
title: Meta releases Muse Wonder for agentic work through its model API and coding product
date: 2026-10-13 06:04:53 +0900
kind: Daily brief
summary: Meta introduced Muse Wonder and Muse Wonder Full; NVIDIA published open Vera Rubin infrastructure designs, Z.ai presented GLM-Legal, and Mastro surfaced a browser-session connector CLI.
figures:
  - value: "19.2%"
    label: GLM-Legal all-pass rate on Harvey LAB, as reported by Z.ai
    url: https://z.ai/blog/glm-legal
  - value: "250kW"
    label: Rack deployment capacity supported by NVIDIA's MGX 1.2 architecture, according to NVIDIA
    url: https://blogs.nvidia.com/blog/ocp-global-summit-vera-rubin-scale-ai-factories/
sources:
  - title: Muse Wonder
    url: https://research.meta.ai/blog/muse-wonder
    outlet: Meta AI Research
  - title: "OCP Global Summit: Amid Ecosystem Adoption, NVIDIA Opens Vera Rubin Architecture to Help Scale AI Factories Worldwide"
    url: https://blogs.nvidia.com/blog/ocp-global-summit-vera-rubin-scale-ai-factories/
    outlet: NVIDIA
  - title: "GLM-Legal: Advancing Agentic Legal Intelligence"
    url: https://z.ai/blog/glm-legal
    outlet: Z.ai
  - title: "mastro-hq/mastro-connect"
    url: https://github.com/mastro-hq/mastro-connect
    outlet: Mastro / GitHub
---

## TOP 3

1. [Meta introduced the Muse Wonder model family for agentic tasks](https://research.meta.ai/blog/muse-wonder).
2. [NVIDIA contributed Vera Rubin rack and compute-tray designs to the Open Compute Project](https://blogs.nvidia.com/blog/ocp-global-summit-vera-rubin-scale-ai-factories/).
3. [Z.ai presented a legal-workflow model built on GLM-5.3-Flash](https://z.ai/blog/glm-legal).

## Models

- **What shipped:** In its [October 12 Muse Wonder announcement](https://research.meta.ai/blog/muse-wonder), Meta introduced Muse Wonder and Muse Wonder Full. Muse Wonder is available through the Meta Model API and Muse Code; Muse Wonder Full is available to Muse Code subscribers. Meta describes Active Memory as retaining and retrieving relevant context across conversations and Active Focus as persisting through a task, trying alternatives and seeking clarification before important actions. Its examples span browser work, coding and personal planning; the company says the model will power Muse experiences later, initially for subscribers.
  - **What remains unestablished:** Meta claims leading results across agent, memory and coding evaluations, but the announcement's comparisons are Meta's own evaluation, not an independent finding about everyday reliability. The page says an additional safety-evaluation report will follow; it does not establish that Muse Wonder is already available to all users of Muse.
- **Specialized legal work:** [Z.ai's October 12 GLM-Legal account](https://z.ai/blog/glm-legal) describes a model built on GLM-5.3-Flash with legal-domain mid-training and post-training alongside an agent harness. Z.ai reports a **19.2% all-pass rate on Harvey LAB**, 12.5 percentage points above its base model, under its reported evaluation; it says AutoClaw integration is forthcoming, not already generally available.

## Tools & Open Source

- **AI-factory infrastructure:** In its [October 12 OCP announcement](https://blogs.nvidia.com/blog/ocp-global-summit-vera-rubin-scale-ai-factories/), NVIDIA says it contributed Vera Rubin rack and compute-tray designs through its open MGX architecture. It describes MGX 1.2 support for racks up to **250kW**, plus open-source DSX components for network configuration, cluster validation, rack management and bare-metal provisioning. These are published designs and components, not measured deployment outcomes across operators.
- **Browser-session connectors:** The [Mastro repository, updated October 12](https://github.com/mastro-hq/mastro-connect), describes a local CLI that captures a logged-in browser session through an extension and turns OpenAPI-described web-app endpoints into agent-callable commands. Its README says credentials are stored locally and connectors are declarative; that is the project's design claim, not an independent security audit.
