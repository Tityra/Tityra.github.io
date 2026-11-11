const test = require('node:test');
const assert = require('node:assert/strict');
const { searchPosts } = require('../assets/js/search.js');

const posts = [
  { title: 'A document parsing model', summary: 'A release', body: 'Vision work', date: '2026.10.22', url: '/2026/10/22/a/' },
  { title: 'Other news', summary: 'Document parsing in practice', body: 'Examples', date: '2026.10.21', url: '/2026/10/21/b/' },
  { title: 'Third post', summary: 'Nothing here', body: 'The new DOCUMENT parsing pipeline runs offline.', date: '2026.10.20', url: '/2026/10/20/c/' },
  { title: 'Unrelated', summary: 'Nothing here', body: 'An unrelated tool', date: '2026.10.19', url: '/2026/10/19/d/' },
];

test('site-wide search finds body-only matches and ranks title before summary before body', () => {
  const found = searchPosts(posts, '  document  parsing ');
  assert.deepEqual(found.map(p => p.url), ['/2026/10/22/a/', '/2026/10/21/b/', '/2026/10/20/c/']);
  assert.match(found[2].excerpt, /DOCUMENT parsing pipeline/);
});

test('all query words must match, with useful empty-query behavior', () => {
  assert.deepEqual(searchPosts(posts, 'document missing'), []);
  assert.deepEqual(searchPosts(posts, '  '), []);
});

test('excerpt uses the matching passage rather than the start of a long post', () => {
  const long = { ...posts[2], body: 'Prefix '.repeat(80) + 'DOCUMENT parsing pipeline at the end.' };
  const [result] = searchPosts([long], 'document parsing');
  assert.match(result.excerpt, /DOCUMENT parsing pipeline/);
  assert.ok(result.excerpt.length < 180);
  assert.match(result.excerpt, /^…(?:\s|[A-Z])/);
  assert.doesNotMatch(result.excerpt, /\s{2,}/);
});

test('an HTML-like query is treated as text, not markup', () => {
  assert.deepEqual(searchPosts(posts, '<script>'), []);
});
