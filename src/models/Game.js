const { Model, DataTypes } = require("sequelize");

class Game extends Model {
  static init(sequelize) {
    super.init(
      {
        name: DataTypes.STRING,
        price: DataTypes.DOUBLE,
        description: DataTypes.STRING,
        releaseDate: DataTypes.STRING,
        developer: DataTypes.STRING,
        platform: DataTypes.STRING,
        image: DataTypes.STRING,
      },
      {
        sequelize,
      }
    );
  }

  static associate(models) {
    this.belongsToMany(models.Category, { through: "games_category" });
    this.belongsToMany(models.Store, { through: "game_store" });
  }
}

module.exports = Game;
