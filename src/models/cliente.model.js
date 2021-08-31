// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function (app) {
  const sequelizeClient = app.get('sequelizeClient');
  const cliente = sequelizeClient.define('cliente', {
    id: {
      primaryKey: true,
      type: DataTypes.INTEGER,
      allowNull: false,

    },
    tipoId: {
      type: DataTypes.STRING,
      allowNull: false
    },
    compania: {
      type: DataTypes.STRING,
      allowNull: false
    },
    representante: {
      type: DataTypes.STRING,
      allowNull: false
    },
    idRepresentante: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    telefono: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    direccion: {
      type: DataTypes.STRING,
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
  cliente.associate = function (models) {
    // Define associations here
    // See http://docs.sequelizejs.com/en/latest/docs/associations/
  };

  return cliente;
};
