// Initializes the `maintenancereport` service on path `/maintenancereport`
const { Maintenancereport } = require('./maintenancereport.class');
const createModel = require('../../models/maintenancereport.model');
const hooks = require('./maintenancereport.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/maintenancereport', new Maintenancereport(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('maintenancereport');

  service.hooks(hooks);
};
