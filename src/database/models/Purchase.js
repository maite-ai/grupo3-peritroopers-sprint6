static associate(models) {
    // hasMany
    Purchase.hasMany(models.Order, {
        foreignKey: 'orderId',
        as: "orders"
      })
    // belongsTo
    Purchase.belongsTo(models.VoucherType);
    Purchase.belongsTo(models.Status);
    Purchase.belongsTo(models.User);
    Purchase.belongsTo(models.Shipping);
}