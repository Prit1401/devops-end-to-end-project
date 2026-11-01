const test = require('node:test');
const assert = require('node:assert/strict');
const { buildResponse } = require('../app-logic');

test('buildResponse returns the expected message and healthy status', () => {
  const result = buildResponse(1);

  assert.equal(result.message, 'Hello from our DevOps Node.js application!');
  assert.equal(result.status, 'healthy');
});

test('buildResponse includes the supplied visit count', () => {
  const result = buildResponse(5);

  assert.equal(result.visits, 5);
});

test('buildResponse preserves a zero visit count', () => {
  const result = buildResponse(0);

  assert.equal(result.visits, 0);
});
