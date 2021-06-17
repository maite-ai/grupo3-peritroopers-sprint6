static associate(models) {
    // hasMany
    Brand.hasMany(models.Product, {
      foreignKey: 'brandId',
      as: "products"
    })
  }