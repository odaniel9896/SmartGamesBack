const { Model, DataTypes } = require("sequelize");

class Store extends Model {
  static init(sequelize) {
    super.init(
      {
        district: DataTypes.STRING,
        street: DataTypes.DOUBLE,
        complement: DataTypes.STRING,
        number: DataTypes.INTEGER,
        cep: DataTypes.STRING,
        latitude: DataTypes.DOUBLE,
        altitude: DataTypes.DOUBLE
      },
      {
        sequelize,
      }
    );
  }

  static associate(models) {
    this.belongsToMany(models.Game, { through: "game_store" });
  }
}

module.exports = Store;
