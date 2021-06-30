const path = require('path');
const DB = require('../database/models');
const sequelize = DB.sequelize;
const { Op } = require("sequelize");

module.exports = {
    add: (req, res) => {
        Promise
            .all(Product.findAll())
            .then((allProducts) => {
                return res.render(path.resolve(__dirname, '..', 'views', 'createProduct'), {allProducts})
            })
            .catch(error => res.send(error))
    },
    create: (req, res) => {
        DB.Product
            .create({
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                image: req.body.image,
                stock: req.body.stock,
                brandId: req.body.brandId,
                categoryId: req.body.categoryId,
                colorId: req.body.colorId
                })
            .then(product => {
                return res.status(200).json({
                    data: product,
                    status: 200,
                    created: 'Ok'
                })
            })
            .catch(error => res.send(error))
    },
    edit: (req, res) => {
        Promise
        .all(Product.findByPk(req.params.id))
        .then((product) => {
            return res.render(path.resolve(__dirname, '..', 'views',  'editProduct'), {product})})
        .catch(error => res.send(error))
    },
    update: (req, res) => {
        DB.Product
            .update({
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                image: req.body.image,
                stock: req.body.stock,
                brandId: req.body.brandId,
                categoryId: req.body.categoryId,
                colorId: req.body.colorId
                }, {
                where: {
                    id: req.params.id
                }
            })
            .then(product => {
                return res.status(200).json({
                    data: product,
                    status: 200,
                    updated: 'Ok'
                })
            })
            .catch(error => res.send(error))
    },
    delete: (req, res) => {
        DB.Product
            .destroy({
                where: {
                    id: req.params.id
                }
            })
            .then((response) => {
                return res.redirect('/')
            })
            .catch(error => res.send(error))
    },
    list: (req, res) => {
        DB.Product
            .findAll()
            .then(products => {
                res.render('index.ejs', {products})
            })
    },
    detail: (req, res) => {
        DB.Product
            .findByPk(req.params.id)
            .then(product => {
                res.render('productDetail.ejs', {product})
            })
    },
    search: (req, res) => {
        DB.Product
            .findAll({
                where: {
                    name: { [Op.like] : '%' + req.query.keyword + '%' }
                }
            })
            .then(products => {
                if(products.length > 0) {
                    return res.status(200).json(products)
                }
                return res.status(200).json('El producto que busca no ha sido encontrado')
            })
    }
}