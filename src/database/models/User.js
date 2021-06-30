'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, dataTypes) => {
  let alias = 'User';

  let cols = {
    id: {
      type: dataTypes.INTEGER.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: dataTypes.STRING(25),
      allowNull: false
    },
    lastName: {
      type: dataTypes.STRING(25),
      allowNull: false
    },
    birthDate: {
      type: dataTypes.DATE,
      allowNull: false
    },
    address: {
      type: dataTypes.STRING(120),
      allowNull: false
    },
    avatar: {
      type: dataTypes.BLOB('medium'),
      allowNull: false
    },
    email: {
      type: dataTypes.STRING(95),
      allowNull: false
    },
    password: {
      type: dataTypes.STRING(16),
      allowNull: false
    },
    userCategoryId: dataTypes.INTEGER.UNSIGNED,
  };

  let config = {
    timestamps: false
  };

  const User = sequelize.define(alias, cols, config);

  User.associate = function(models) {
    // hasMany
    User.hasMany(models.Purchase, {
      foreignKey: 'userId',
      as: "purchases"
    })
    // belongsTo
    User.belongsTo(models.UserCategory, {
      foreignKey: 'userCategoryId',
      as: 'userCategories'
    });
  }

  return User

}