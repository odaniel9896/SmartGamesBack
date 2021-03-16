const { Model, DataTypes } = require("sequelize");

class Category extends Model {
    static init(sequelize) {
        super.init(
            {
                description: DataTypes.STRING
            },
            {
                sequelize,
            }
        )
    }
    static associate(models) {
        this.belongsToMany(models.Game, { through: "games_category" });
    }
}

module.exports = Category;