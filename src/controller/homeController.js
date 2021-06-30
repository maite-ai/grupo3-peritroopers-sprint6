const path = require('path');
const DB = require('../database/models');
const sequelize = DB.sequelize;
const { Op } = require("sequelize");

let homeController = {
    show: async (req, res) => {
        try{
            const products = DB.Product.findAll();
            res.render('index', { products });
        }
        catch(error) {
            console.log(error)
        }
    },

    faq: (req, res) => {
        res.render("faq");
    }
}

module.exports = homeController