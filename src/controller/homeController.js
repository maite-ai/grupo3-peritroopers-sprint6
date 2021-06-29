const jsonDB = require('../database/models');
const productModel = jsonDB('Product');

let homeController = {
    show: (req, res) => {
        const products = productModel.all();
        res.render('index', { products });
    },

    faq: (req, res) => {
        res.render("faq");
    }
}

module.exports = homeController