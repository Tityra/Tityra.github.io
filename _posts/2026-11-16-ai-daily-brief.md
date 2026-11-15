---
title: db-branch opens disposable database copies for agent experiments
date: 2026-11-16 06:03:15 +0900
kind: Daily brief
summary: A self-hosted database branching project offers disposable copies for agents and CI; new agent-testing and browser-MCP tools also surfaced.
figures:
  - value: "0.5 s"
    label: PostgreSQL branch creation in db-branch's own three-node test cluster
    url: https://github.com/db-branch/db-branch
  - value: "93.9%"
    label: Token saving versus HTML in turbo-browser-mcp's own dense-UI snapshot benchmark
    url: https://github.com/Tthanh2k6/turbo-browser-mcp
sources:
  - title: "Show HN: db-branch – database branches in seconds for AI agents and CI, via ZFS"
    url: https://news.ycombinator.com/item?id=50506940
    outlet: Hacker News
  - title: db-branch repository and README
    url: https://github.com/db-branch/db-branch
    outlet: db-branch / GitHub
  - title: "Show HN: Turbo-Browser-MCP – Batch forms, DOM deltas and submit guards for MCP"
    url: https://news.ycombinator.com/item?id=50503930
    outlet: Hacker News
  - title: turbo-browser-mcp repository and README
    url: https://github.com/Tthanh2k6/turbo-browser-mcp
    outlet: Tthanh2k6 / GitHub
  - title: "Show HN: Attest – Test what AI agents do, not just what they say"
    url: https://news.ycombinator.com/item?id=50509107
    outlet: Hacker News
  - title: Attest framework documentation
    url: https://attest-framework.github.io/
    outlet: Attest Framework
  - title: "Show HN: Canban – Kanban and Workflow and Herdr Workbench for CLI Agents"
    url: https://news.ycombinator.com/item?id=50508535
    outlet: Hacker News
  - title: Canban repository and README
    url: https://github.com/jjyr/canban
    outlet: jjyr / GitHub
---

## TOP 3

1. [db-branch's maker introduced self-hosted, disposable database branches for agent and CI work](https://news.ycombinator.com/item?id=50506940).
2. [A Playwright-based MCP server was presented for batched browser interactions](https://news.ycombinator.com/item?id=50503930).
3. [Attest's maker presented tests for agents' tool calls and external-state changes](https://news.ycombinator.com/item?id=50509107).

## Agentic AI & Agent Skills

- **Testing behavior, not just replies:** In a [November 15 Show HN launch](https://news.ycombinator.com/item?id=50509107), Attest's maker presented a [Python and TypeScript testing framework](https://attest-framework.github.io/) that records agent runs, replays recorded model responses against agent code, and checks tool traces and external-state contracts. Its documentation says replay removes live-model variability, not flaky tool dependencies, and its gate only covers the contracts supplied by the developer.

## MCP & Plug-in

- **Batched browser control:** In a [November 15 Show HN launch](https://news.ycombinator.com/item?id=50503930), the maker shared [turbo-browser-mcp](https://github.com/Tthanh2k6/turbo-browser-mcp), a Playwright MCP server with compact and changed-only DOM snapshots, form filling across frames, file-path uploads and a default guard before submitting. Its token and latency comparisons are the author's local benchmarks, not independent end-to-end agent evaluations.

## Tools & Open Source

- **Database sandboxes for agents:** In a [November 15 Show HN launch](https://news.ycombinator.com/item?id=50506940), the author introduced [db-branch](https://github.com/db-branch/db-branch), a self-hosted, Apache-licensed beta for creating and discarding MySQL and PostgreSQL branches from ZFS snapshots. Each branch runs its own database process; the project's CLI, API, web console and MCP server let a developer or agent work against a disposable copy rather than a shared staging database. The author says a branch can be reset or expired and describes optional cluster routing through ProxySQL.
  - **Limits of the claim:** The README requires Ubuntu and ZFS for the native installation, says a consistent base snapshot comes from a stopped replica or restored backup rather than a live production database, and notes that separate database processes still consume memory and heavily written branches consume disk. Its reported **0.5-second PostgreSQL** and **3-second MySQL** branch times are from the project's own three-node test cluster; the source does not establish performance on other deployments. The core is open source, while some governance and history modules are separately licensed.
- **A board for CLI-agent work:** In a [November 15 Show HN post](https://news.ycombinator.com/item?id=50508535), Canban's maker described a [Rust workbench](https://github.com/jjyr/canban) combining Kanban cards, workflow-triggered agent runs in isolated Git worktrees, review gates and persistent terminal sessions for existing agent CLIs; the repository describes it as Apache-licensed.
