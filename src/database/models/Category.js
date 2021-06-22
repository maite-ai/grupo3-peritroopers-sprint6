modules.exports = (sequelize, dataTypes) => {
  let alias = 'Category';

  let cols = {
    id: {
      type: dataTypes.INTEGER.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: dataTypes.STRING(45),
      allowNull: false
    }
  };

  let config = {
    timestamps: false
  };

  const Category = sequelize.define(alias, cols, config);

  Category.associate = function(models) {
    // hasMany
    Category.hasMany(models.Product, {
      foreignKey: 'categoryId',
      as: 'products',
    });
  }

  return Category

}