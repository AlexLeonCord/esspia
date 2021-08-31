const assert = require('assert');
const app = require('../../src/app');

describe('\'cliente\' service', () => {
  it('registered the service', () => {
    const service = app.service('cliente');

    assert.ok(service, 'Registered the service');
  });
});
