modules.exports = (sequelize, dataTypes) => {
  let alias = 'Status';

  let cols = {
    id: {
      type: dataTypes.INTEGER.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: dataTypes.STRING(45),
      allowNull: false
    }
  };

  let config = {
    timestamps: false
  };

  const Status = sequelize.define(alias, cols, config);
  
  Status.associate = function(models) {
      // hasMany
      Status.hasMany(models.Purchase, {
          foreignKey: 'statusId',
          as: "purchases"
        })
  }

  return Status

}