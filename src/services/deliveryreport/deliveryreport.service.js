// Initializes the `deliveryreport` service on path `/deliveryreport`
const { Deliveryreport } = require('./deliveryreport.class');
const createModel = require('../../models/deliveryreport.model');
const hooks = require('./deliveryreport.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/deliveryreport', new Deliveryreport(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('deliveryreport');

  service.hooks(hooks);
};
