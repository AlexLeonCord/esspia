const assert = require('assert');
const app = require('../../src/app');

describe('\'imgloads\' service', () => {
  it('registered the service', () => {
    const service = app.service('imgloads');

    assert.ok(service, 'Registered the service');
  });
});
