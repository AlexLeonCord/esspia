const assert = require('assert');
const app = require('../../src/app');

describe('\'cotizationproducts\' service', () => {
  it('registered the service', () => {
    const service = app.service('cotizationproducts');

    assert.ok(service, 'Registered the service');
  });
});
