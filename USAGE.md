# Writing a brief

## 1. Create the file

`_posts/YYYY-MM-DD-slug.md`, with front matter:

```yaml
---
title: A sentence that says what happened
date: 2026-09-30 09:00:00 +0900
kind: Daily brief          # or: Weekly brief, Note
summary: One line for the index and the feed.
sources:
  - title: Exact page title
    url: https://…
    outlet: Publisher
---
```

`sources` renders as a numbered list at the foot of the post. Every factual
claim in the body must be traceable to one of them — that is the whole contract
of the site, and [`POLICY_NEWS.md`](POLICY_NEWS.md) is the long form of it.

## 2. Write the body

```markdown
## The short version
- One complete sentence per story, link inline.

## <Story headline>
What happened, what is new, what it does not yet tell us.

## Worth watching
Explicitly forward-looking. Optional.
```

A quiet day is three bullets and no sections. Do not pad to fill the shape.

For an inverted emphasis block, matching the deck's solid nodes:

```html
<div class="callout" markdown="1">
<span class="eyebrow">Label</span>
The claim worth stopping on.
</div>
```

## 3. Check before publishing

- Every link resolves and points at what the text says it does.
- Every number in the text appears in a linked source.
- The headline is supported by the body, not by its most exciting bullet.
- Vendor claims read as vendor claims.

## 4. Publish

```bash
git add _posts/YYYY-MM-DD-slug.md
git commit -m "brief: <headline>"
git push
```

GitHub Pages rebuilds on push, usually within a minute.

## Corrections

Do not delete a wrong claim. Strike it and append, at the foot of the post:

```markdown
**Correction, 2026-10-02.** The original said X. The source says Y; the claim
has been corrected above.
```
