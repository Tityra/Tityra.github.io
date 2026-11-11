(function () {
  "use strict";

  function searchPosts(posts, rawQuery) {
    const words = rawQuery.trim().toLocaleLowerCase().split(/\s+/u).filter(Boolean);
    if (!words.length) return [];

    return posts.flatMap(function (post) {
      const title = post.title.toLocaleLowerCase();
      const summary = post.summary.toLocaleLowerCase();
      const body = post.body.toLocaleLowerCase();
      const all = title + " " + summary + " " + body;
      if (!words.every(function (word) { return all.includes(word); })) return [];

      const score = words.reduce(function (sum, word) {
        return sum + (title.includes(word) ? 3 : summary.includes(word) ? 2 : 1);
      }, 0);
      const source = (words.some(function (word) { return body.includes(word); }) ? post.body : post.summary || post.title)
        .replace(/\s+/gu, " ").trim();
      const lowered = source.toLocaleLowerCase();
      const positions = words.map(function (word) { return lowered.indexOf(word); }).filter(function (i) { return i >= 0; });
      const offset = positions.length ? Math.max(0, Math.min.apply(null, positions) - 55) : 0;
      const start = offset ? Math.max(0, source.indexOf(" ", offset) + 1) : 0;
      const excerpt = (start ? "…" : "") + source.slice(start, start + 145).trim() + (start + 145 < source.length ? "…" : "");
      return [{ title: post.title, date: post.date, url: post.url, excerpt: excerpt, score: score }];
    }).sort(function (a, b) { return b.score - a.score || b.date.localeCompare(a.date); });
  }

  if (typeof module !== "undefined" && module.exports) module.exports = { searchPosts: searchPosts };
  if (typeof document === "undefined") return;

  const field = document.getElementById("site-search");
  if (!field) return;
  const status = document.getElementById("search-status");
  const results = document.getElementById("search-results");
  let posts = null;

  function render() {
    results.replaceChildren();
    const query = field.value.trim();
    if (!query) {
      status.textContent = "Enter a word or phrase to search every brief.";
      return;
    }
    if (!posts) return;
    const found = searchPosts(posts, query);
    status.textContent = found.length + (found.length === 1 ? " brief found." : " briefs found.");
    found.forEach(function (post) {
      const item = document.createElement("li");
      item.className = "brief search-result";
      const meta = document.createElement("time");
      meta.className = "brief__meta";
      meta.textContent = post.date;
      const detail = document.createElement("div");
      const heading = document.createElement("h2");
      heading.className = "brief__title";
      const link = document.createElement("a");
      link.href = post.url;
      link.textContent = post.title;
      heading.appendChild(link);
      const excerpt = document.createElement("p");
      excerpt.className = "brief__summary";
      excerpt.textContent = post.excerpt;
      detail.append(heading, excerpt);
      item.append(meta, detail);
      results.appendChild(item);
    });
  }

  field.addEventListener("input", render);
  status.textContent = "Loading search index…";
  fetch(field.dataset.indexUrl)
    .then(function (response) {
      if (!response.ok) throw new Error("Search index unavailable");
      return response.json();
    })
    .then(function (data) { posts = data; render(); })
    .catch(function () { status.textContent = "Search is unavailable. Browse the archive instead."; });
})();
