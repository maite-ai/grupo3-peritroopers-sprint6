modules.exports = (sequelize, dataTypes) => {
    let alias = 'Order';
  
    let cols = {
      id: {
        type: dataTypes.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      quantity: {
        type: dataTypes.INTEGER(11),
        allowNull: false
      },
      subtotal: {
        type: dataTypes.DECIMAL(11, 2),
        allowNull: false
      },
      discount: {
        type: dataTypes.INTEGER(11),
        allowNull: true
      },
      productId: dataTypes.INTEGER.UNSIGNED,
      purchaseId: dataTypes.INTEGER.UNSIGNED,
    };
  
    let config = {
      timestamps: false
    };
  
    const Order = sequelize.define(alias, cols, config);
  
    Order.associate = function(models) {
        // belongsTo
        Order.belongsTo(models.Product, {
            foreignKey: 'productId',
            as: 'products'
        });
        // belongsTo
        Order.belongsTo(models.Purchase, {
            foreignKey: 'purchaseId',
            as: 'purchases'
        });
    }

    return Order

}
