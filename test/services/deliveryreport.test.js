const assert = require('assert');
const app = require('../../src/app');

describe('\'deliveryreport\' service', () => {
  it('registered the service', () => {
    const service = app.service('deliveryreport');

    assert.ok(service, 'Registered the service');
  });
});
