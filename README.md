# Tityra

A brief on technology news. Short, plain, and sourced — every factual claim in
every post traces to a link at the foot of it.

Live at **https://tityra.github.io/**

## The rule that matters

The failure mode of an automated news blog is not dullness, it is **confident
wrongness**: a summary that quietly misstates what happened, published daily
under a real name, with nobody reading it first. It reads exactly as fluently as
a correct one.

[`POLICY_NEWS.md`](POLICY_NEWS.md) is written against that. Nothing without a
source; say only what the source says; no invented numbers; mark the difference
between fact, interpretation and speculation; correct in place and date it.

## Stack

- GitHub Pages + Jekyll (no build step to maintain; GitHub builds it)
- Markdown posts in `_posts/`
- Newsreader · Hanken Grotesk · DM Mono, one ink on gridded paper

## Structure

```text
index.html            Home — latest briefs
archive.html          Every brief, at /archive/
about.md              What this is, at /about/
feed.xml              Atom feed, at /feed.xml
_posts/YYYY-MM-DD-*.md  Individual briefs
_layouts/             default + post
assets/css/styles.css The design system
POLICY_NEWS.md        Standing editorial policy
USAGE.md              How to write and publish a brief
```

## Local preview

```bash
gem install bundler && bundle install
./scripts/preview.sh          # http://127.0.0.1:4181/
```

GitHub Pages builds and deploys on push to `main`; the local server is only for
checking layout before that.
