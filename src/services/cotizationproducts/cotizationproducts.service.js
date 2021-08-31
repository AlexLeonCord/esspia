// Initializes the `cotizationproducts` service on path `/cotizationproducts`
const { Cotizationproducts } = require('./cotizationproducts.class');
const createModel = require('../../models/cotizationproducts.model');
const hooks = require('./cotizationproducts.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/cotizationproducts', new Cotizationproducts(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('cotizationproducts');

  service.hooks(hooks);
};
