module.exports = (sequelize, dataTypes) => {
    let alias = 'UserCategory';
  
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
  
    const UserCategory = sequelize.define(alias, cols, config);

    UserCategory.associate = function(models) {
        // hasMany
        UserCategory.hasMany(models.User, {
        foreignKey: 'userCategoryId',
        as: "users"
        })
    }

    return UserCategory

}