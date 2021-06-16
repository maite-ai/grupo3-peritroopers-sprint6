const jsonDB = require('../model/jsonDatabase');
const productModel = jsonDB('products');

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