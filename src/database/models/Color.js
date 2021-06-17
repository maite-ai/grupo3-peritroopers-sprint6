static associate(models) {
    Color.belongsToMany(models.Product, {
      as: 'products',
      through: 'colorProduct',
      
    }); 
  }