'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, dataTypes) => {
  let alias = 'VoucherType';

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

  const VoucherType = sequelize.define(alias, cols, config);
  
  VoucherType.associate = function(models) {
      // hasMany
      VoucherType.hasMany(models.Purchase, {
          foreignKey: 'voucherTypeId',
          as: "purchases"
        })
  }

  return VoucherType

}