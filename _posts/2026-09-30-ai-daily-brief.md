---
title: Cohere released Embed 5 as Cloudflare opened Auto Router beta
date: 2026-09-30 22:45:00 +0900
kind: Daily brief
summary: Cohere released new embedding models, Cloudflare opened AI Gateway Auto Router beta, and Pi's MCP support drew discussion.
figures:
  - value: "$0.12"
    label: Embed 5 Pro, per million tokens (Cohere)
  - value: "1,700%"
    label: Growth in daily AI agent requests on Cloudflare's network, year on year
  - value: "up to 30%"
    label: Auto Router saving in Cloudflare's own internal usage
sources:
  - title: Introducing Embed 5—A New Family of Frontier Embedding Models
    url: https://cohere.com/blog/embed-5
    outlet: Cohere
  - title: Cut your AI spend with AI Gateway's Auto Router
    url: https://blog.cloudflare.com/auto-router/
    outlet: Cloudflare
  - title: The Internet has a second audience
    url: https://blog.cloudflare.com/agentic-web/
    outlet: Cloudflare
  - title: “You Said No MCP!”
    url: https://earendil.com/posts/you-said-no-mcp/
    outlet: Earendil Engineering
  - title: 'Pi.dev: You Said No MCP | Hacker News'
    url: https://news.ycombinator.com/item?id=49906637
    outlet: Hacker News
---

## The short version

- Cohere [introduced Embed 5](https://cohere.com/blog/embed-5) on September 30, with Pro and Fast embedding models that share an embedding space.
- Cloudflare [opened Auto Router in public beta](https://blog.cloudflare.com/auto-router/) on September 30 for AI Gateway requests sent to `cloudflare/auto`.
- Cloudflare [published its account of agent traffic](https://blog.cloudflare.com/agentic-web/) on September 30, based on traffic observed on its network.
- A [Hacker News discussion](https://news.ycombinator.com/item?id=49906637) on September 30 focused on [Earendil Engineering's September 29 explanation](https://earendil.com/posts/you-said-no-mcp/) of why Pi now supports MCP in its core.

## Cohere released Embed 5 Pro and Fast

- In its [September 30 announcement](https://cohere.com/blog/embed-5), Cohere says the two models support text and image inputs and share an embedding space, allowing indexing with Pro and queries with either model.
- Cohere lists API pricing at $0.12 per million tokens for Pro and $0.08 for Fast; its retrieval comparisons are [Cohere's own evaluations](https://cohere.com/blog/embed-5), not independent results.

## Cloudflare opened Auto Router beta for AI Gateway

- Cloudflare's [September 30 announcement](https://blog.cloudflare.com/auto-router/) says `cloudflare/auto` selects a model for each compatible request subject to gateway configuration and access controls.
- Cloudflare reports savings of up to 30% in its own early internal OpenCode usage; the [company's benchmark](https://blog.cloudflare.com/auto-router/) also describes differences in task success rates and cost, so the savings figure is not a general guarantee.

## Cloudflare described agent traffic on its network

- In [its September 30 post](https://blog.cloudflare.com/agentic-web/), Cloudflare reports that daily requests from AI agents on its network rose by more than 1,700% over the previous year. This is Cloudflare's network measurement, not an estimate of all Internet traffic.

## Pi's MCP support drew community discussion

- [Earendil Engineering's September 29 post](https://earendil.com/posts/you-said-no-mcp/) says Pi moved MCP support into its core and uses a JavaScript sandbox called Codemode to coordinate tool calls.
- The [September 30 Hacker News thread](https://news.ycombinator.com/item?id=49906637) discusses MCP tools, resources, prompts, and differences in client implementations; those comments are participants' views, not a protocol announcement.
