'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, dataTypes) => {
  let alias = 'Color';

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

  const Color = sequelize.define(alias, cols, config);

  Color.associate = function(models) {
    Color.hasMany(models.Product, {
      foreignKey: 'colorId',
      as: 'products'
    }); 
  }

  return Color

}