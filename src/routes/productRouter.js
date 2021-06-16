const express = require('express');
const router = express.Router();
const controller = require('../controller/productController');
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

router.get("/productCart", authMiddleware, controller.productCart);

router.get("/create", authMiddleware, controller.create);

router.get("/:id", controller.show);

router.get('/search', controller.search);

router.get("/:id/edit", authMiddleware, controller.edit);

router.post('/store', upload.single('image'), controller.store);

router.put('/:id', upload.single('image'), controller.update);

router.delete('/:id', authMiddleware, controller.destroy);

module.exports = router;