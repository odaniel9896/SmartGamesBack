const { Model, DataTypes } = require("sequelize");

class Order extends Model {
  static init(sequelize) {
    super.init(
      {
        pricePaid: DataTypes.DECIMAL,
        gameId: DataTypes.INTEGER,
      },
      {
        sequelize,
      }
    );
  }

  static associate(models) {
    this.hasOne(models.Game);
  }
}

module.exports = Order;