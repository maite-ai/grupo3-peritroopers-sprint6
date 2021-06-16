const jsonDB = require('../model/jsonDatabase');
const productModel = jsonDB('products');

let productController = {
    home: (req, res) => {
        res.redirect('/');
    },
    show: (req, res) => {
        const product = productModel.find(req.params.id);
        if(product){
            res.render('productDetail', { product });
        }else{
            res.render('error404');
        }
    },
    create: (req, res) => {
        res.render('createProduct');
    },

    // Función que simula el almacenamiento (?)
    store: (req, res) => {
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