// Initializes the `imgloads` service on path `/imgloads`
const { Imgloads } = require('./imgloads.class');
const createModel = require('../../models/imgloads.model');
const hooks = require('./imgloads.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/imgloads', new Imgloads(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('imgloads');

  service.hooks(hooks);
};
