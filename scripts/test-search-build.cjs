const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const { searchPosts } = require('../assets/js/search.js');

const root = path.resolve(__dirname, '..');

test('Jekyll indexes every published brief including body text, not just homepage titles', () => {
  const destination = fs.mkdtempSync(path.join(os.tmpdir(), 'tityra-search-'));
  try {
    execFileSync('ruby', ['-e', 'gem "jekyll", "4.4.1"; require "jekyll"; Jekyll::Commands::Build.process({"source"=>".", "destination"=>ARGV.fetch(0)})', destination], {
      cwd: root, stdio: 'pipe', timeout: 120000,
    });
    const posts = JSON.parse(fs.readFileSync(path.join(destination, 'search-index.json'), 'utf8'));
    const sourceCount = fs.readdirSync(path.join(root, '_posts')).filter(p => p.endsWith('.md')).length;
    assert.equal(posts.length, sourceCount);
    assert.ok(posts.every(p => p.title && p.date && p.url && p.body && typeof p.summary === 'string'));
    const documentPost = posts.find(p => p.url === '/2026/10/22/ai-daily-brief/');
    assert.match(documentPost.body.toLowerCase(), /parse model for extracting document content/);
    assert.ok(searchPosts(posts, 'document parsing').some(p => p.url === documentPost.url));
    assert.ok(fs.existsSync(path.join(destination, 'search', 'index.html')));
  } finally {
    fs.rmSync(destination, { recursive: true, force: true });
  }
});
