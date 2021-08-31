// Initializes the `cotizationreport` service on path `/cotizationreport`
const { Cotizationreport } = require('./cotizationreport.class');
const createModel = require('../../models/cotizationreport.model');
const hooks = require('./cotizationreport.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/cotizationreport', new Cotizationreport(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('cotizationreport');

  service.hooks(hooks);
};
