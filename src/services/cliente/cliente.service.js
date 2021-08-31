// Initializes the `cliente` service on path `/cliente`
const { Cliente } = require('./cliente.class');
const createModel = require('../../models/cliente.model');
const hooks = require('./cliente.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/cliente', new Cliente(options, app));

 

  // Get our initialized service so that we can register hooks
  const service = app.service('cliente');

  service.hooks(hooks);
};
