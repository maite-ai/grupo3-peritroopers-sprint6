'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, dataTypes) => {
  let alias = 'Purchase';

  let cols = {
    id: {
      type: dataTypes.INTEGER.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    voucherNumber: {
      type: dataTypes.BIGINT(15),
      allowNull: false
    },
    date: {
      type: dataTypes.DATE,
      allowNull: false
    },
    total: {
      type: dataTypes.DECIMAL(12, 2),
      allowNull: false
    },
    shippingId: dataTypes.INTEGER.UNSIGNED,
    statusId: dataTypes.INTEGER.UNSIGNED,
    userId: dataTypes.INTEGER.UNSIGNED,
    voucherTypeId: dataTypes.INTEGER.UNSIGNED,
  };

  let config = {
    timestamps: false
  };

  const Purchase = sequelize.define(alias, cols, config);

  Purchase.associate = function(models) {
    // hasMany
    Purchase.hasMany(models.Order, {
        foreignKey: 'purchaseId',
        as: "orders"
      })
    // belongsTo
    Purchase.belongsTo(models.VoucherType, {
      foreignKey: 'voucherTypeId',
      as: "voucherTypes"
    });
    Purchase.belongsTo(models.Status, {
      foreignKey: 'statusId',
      as: "status"
    });
    Purchase.belongsTo(models.User, {
      foreignKey: 'userId',
      as: "users"
    });
    Purchase.belongsTo(models.Shipping, {
      foreignKey: 'shippingId',
      as: "shippings"
    });
  }

  return Purchase

}