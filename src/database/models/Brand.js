'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, dataTypes) => {
  let alias = 'Brand';

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

  const Brand = sequelize.define(alias, cols, config);

  Brand.associate = function(models) {
    // hasMany
    Brand.hasMany(models.Product, {
      foreignKey: 'brandId',
      as: "products"
    })
  }

  return Brand;

}

