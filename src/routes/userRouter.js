const express = require('express');
const router = express.Router();
const controller = require('../controller/usersController');
const uploadFile=require('../middlewares/multerMiddleware')
const validations=require('../middlewares/userValidationsMiddleware')
const authMiddleware=require('../middlewares/authMiddleware')
const guestMiddleware=require('../middlewares/guestMiddleware')
router.get('/register', guestMiddleware, controller.register);
router.post('/register', uploadFile.single('avatar'), validations, controller.processRegister);
router.get('/login', guestMiddleware, controller.login);
router.post('/login', controller.loginProcess);
router.get('/profile/', authMiddleware, controller.profile);
router.get('/logout/', controller.logout)
module.exports = router;