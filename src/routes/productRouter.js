const express = require('express');
const router = express.Router();
const productController = require('../controller/productController');
const multer = require('multer');
const authMiddleware=require('../middlewares/authMiddleware')
const path = require('path');
const storage = multer.diskStorage({
    destination: path.resolve(__dirname, '../public/images'),
    filename: (req, file, cb) => {
        cb(null, 'img-' + Date.now() + path.extname(file.originalname));
    }
});
const upload = multer({storage});

router.get("/productCart", authMiddleware, productController.productCart);

router.get('/', productController.list)

router.get('/create', authMiddleware, productController.create)

router.get('/:id', productController.detail)

router.get('/search', productController.search)

router.get('/edit/:id', authMiddleware, productController.edit)

router.post('/store', upload.single('image'), productController.store)

router.put('/:id', upload.single('image'), productController.update)

router.delete('/delete/:id', authMiddleware, productController.destroy)


module.exports = router;