static associate(models) {
    // belongsTo
    Order.belongsTo(models.Product);
    // belongsTo
    Order.belongsTo(models.Purchase);
}