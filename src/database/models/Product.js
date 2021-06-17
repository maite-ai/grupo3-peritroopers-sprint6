static associate(models) {
    // belongsTo
    Product.belongsToMany(models.Brand, {
      as: 'brands',
      through: 'brandProduct'
    });

    // belongsToMany
    Product.belongsToMany(models.Color, {
      as: 'colors',
      through: 'colorProduct',
    });
    // belongsToMany
    Product.belongsToMany(models.Category, {
      as: 'categories',
      through: 'categoryProduct',

    });
    // hasMany
    Product.hasMany(models.Order, {
        foreignKey: 'orderId',
        as: "orders"
      })
  }