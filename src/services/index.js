const users = require('./users/users.service.js');
const cliente = require('./cliente/cliente.service.js');
const product = require('./product/product.service.js');
const uploads = require('./uploads/uploads.service.js');
const imgloads = require('./imgloads/imgloads.service.js');
const images = require('./images/images.service.js');
const cotizationproducts = require('./cotizationproducts/cotizationproducts.service.js');
const maintenancereport = require('./maintenancereport/maintenancereport.service.js');
const cotizationreport = require('./cotizationreport/cotizationreport.service.js');
const deliveryreport = require('./deliveryreport/deliveryreport.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(users);
  app.configure(cliente);
  app.configure(product);
  app.configure(uploads);
  app.configure(imgloads);
  app.configure(images);
  app.configure(cotizationproducts);
  app.configure(maintenancereport);
  app.configure(cotizationreport);
  app.configure(deliveryreport);
};
