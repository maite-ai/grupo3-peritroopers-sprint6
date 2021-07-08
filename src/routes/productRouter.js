const express = require('express');
const router = express.Router();
const productController = require('../controller/productController');
const multer = require('multer');
const authMiddleware=require('../middlewares/authMiddleware')
const path = require('path');
const uploadFile = require('../middlewares/multerMiddlewareProduct');

router.get("/productCart", authMiddleware, productController.productCart);

router.get('/', productController.list)

router.get('/create', authMiddleware, productController.create)

router.get('/:id', productController.detail)

router.get('/search', productController.search)

router.get('/:id/edit', authMiddleware, productController.edit)

router.post('/store', uploadFile.single('image'), productController.store)

router.put('/:id', uploadFile.single('image'), productController.update)

router.get('/delete/:id', productController.delete);
router.delete('/delete/:id', productController.destroy);


module.exports = router;