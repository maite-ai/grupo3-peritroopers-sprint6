static associate(models) {
    // hasMany
    Category.hasMany(models.Product, {
      foreignKey: 'categoryId',
      as: 'products',
    });
  }