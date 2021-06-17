static associate(models) {
    // hasMany
    User.hasMany(models.Purchase, {
      foreignKey: 'userId',
      as: "purchases"
    })
    // belongsTo
    Product.belongsTo(models.Brand);
  }