// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function (app) {
  const sequelizeClient = app.get('sequelizeClient');
  const cotizationreport = sequelizeClient.define('cotizationreport', {
    idClient: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    idUser: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    descriptionTypeService: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    idServiceReport: {
      primaryKey:true,
      type: DataTypes.STRING,
      allowNull: false
    },
    idPerson: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    namePerson: {
      type: DataTypes.STRING,
      allowNull: false
    },
    firmImage: {
      type: DataTypes.TEXT,
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
  cotizationreport.associate = function (models) {
    // Define associations here
    // See http://docs.sequelizejs.com/en/latest/docs/associations/
  };

  return cotizationreport;
};
