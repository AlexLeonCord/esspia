// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function (app) {
  const sequelizeClient = app.get('sequelizeClient');
  const cotizationproducts = sequelizeClient.define('cotizationproducts', {
    id: {
      primaryKey:true,
      type: DataTypes.STRING,
      allowNull: true
    },
    
    idService: {
      primaryKey:true,
      type: DataTypes.STRING,
      allowNull: false
    },
    idProduct: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    nameProduct: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    price: {
      type: DataTypes.DECIMAL,
      allowNull: false
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    total: {
      type: DataTypes.DECIMAL,
      allowNull: false
    }
  }, {
    hooks: {
      beforeCount(options) {
        options.raw = true;
      }
    }
  });

  // eslint-disable-next-line no-unused-vars
  cotizationproducts.associate = function (models) {
    // Define associations here
    // See http://docs.sequelizejs.com/en/latest/docs/associations/
  };

  return cotizationproducts;
};
