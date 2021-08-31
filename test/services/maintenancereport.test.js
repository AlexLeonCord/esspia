const assert = require('assert');
const app = require('../../src/app');

describe('\'maintenancereport\' service', () => {
  it('registered the service', () => {
    const service = app.service('maintenancereport');

    assert.ok(service, 'Registered the service');
  });
});
