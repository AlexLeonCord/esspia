const assert = require('assert');
const app = require('../../src/app');

describe('\'cotizationreport\' service', () => {
  it('registered the service', () => {
    const service = app.service('cotizationreport');

    assert.ok(service, 'Registered the service');
  });
});
