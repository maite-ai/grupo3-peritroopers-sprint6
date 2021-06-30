const path = require('path');
const DB = require('../database/models');
const sequelize = DB.sequelize;
const { Op } = require("sequelize");

let productController = {
    home: (req, res) => {
        res.redirect('/');
    },
    list: async (req, res) => {
        try {
            let products = await DB.Product.findAll({
                include: [{association: "brands"}, {association: "categories"}, {association: "colors"}]
            });
            products = JSON.parse(JSON.stringify(products))
            return res.render('catalogue', { products:products })
        }
        catch(error) {
            res.render('error404')
        }
    },
    detail: (req, res) => {
        const product = DB.Product.findByPk(req.params.id);
        try{
            res.render('productDetail', { product });
        }
        catch(error){
            res.render('error404');
        }
    },
    create: async (req, res) => {
        let productBrand = await DB.Brand.findAll()
        let productCategory = await DB.Category.findAll()
        let productColor = await DB.Color.findAll()
        return res.render('createProduct', {productBrand, productCategory, productColor})
    },

    // Función que simula el almacenamiento (?)
    store: async (req, res) => {
        let productCreated = await DB.Product.create({
            name: req.body.name,
            description: req.body.description,
            price: req.body.price,
            image: req.body.image,
            stock: req.body.stock,
            brandId: req.body.brandId,
            categoryId: req.body.categoryId,
            colorId: req.body.colorId

        })
        console.log(req.files);
        // Atrapa los contenidos del formulario... Ponele
        const product = req.body;
        // Verificar si viene un archivo, para nombrarlo.
        product.image = req.file ? req.file.filename : '';
        console.log(product.image);
        console.log(product);
        // Cuidado sólo mando el cuerpo del FORM, el Id me lo asigna el Modelo  
        productModel.create(product);
            res.redirect('/');
    },

    edit: (req, res) => {
        let product = productModel.find(req.params.id);
        console.log(product);
        if(product){
            res.render("editProduct", {product});
        }else {
            res.render('error404');
        }        
    },

    // Función que realiza cambios en el producto seleccionado. Continuará...
    update: (req, res) => {
        let product = req.body;
        product.id = req.params.id;
            product.image = req.file ? req.file.filename : req.body.oldImage;    
            if(req.body.image === undefined) {
                product.image = product.oldImage;
            }

            console.log(product.image);
            console.log(product);

        delete product.oldImage;
        productModel.update(product);
        res.redirect('/');
    },

    destroy: (req, res) => {
        productModel.delete(req.params.id);
        res.redirect('/');
    },

    productCart: (req, res) => { 
        res.render("productCart");
    },

    productDetail: (req, res) => {
        res.render("productDetail");
    },

    search: (req, res) => {
        let dataABuscar = req.query;
        res.send(dataABuscar);
    }
}

module.exports = productController