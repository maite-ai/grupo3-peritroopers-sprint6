modules.exports = (sequelize, dataTypes) => {
  let alias = 'Shipping';

  let cols = {
    id: {
      type: dataTypes.INTEGER.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    street: {
      type: dataTypes.STRING(45),
      allowNull: false
    },
    number: {
      type: dataTypes.INTEGER(11),
      allowNull: false
    },
    floor: {
      type: dataTypes.INTEGER(11),
      allowNull: true
    },
    apartment: {
      type: dataTypes.STRING(5),
      allowNull: true
    },
    city: {
      type: dataTypes.STRING(45),
      allowNull: false
    },
    province: {
      type: dataTypes.STRING(45),
      allowNull: false
    },
    postalCode: {
      type: dataTypes.INTEGER(11),
      allowNull: false
    }
  };

  let config = {
    timestamps: false
  };

  const Shipping = sequelize.define(alias, cols, config);
  
  Shipping.associate = function(models) {
      // hasMany
      Shipping.hasMany(models.Purchase, {
          foreignKey: 'shippingId',
          as: "purchases"
        })
  }

  return Shipping

}