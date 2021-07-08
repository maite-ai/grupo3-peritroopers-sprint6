const express = require('express');
const router = express.Router();
const userController = require('../controller/usersController');
const uploadFile = require('../middlewares/multerMiddlewareUser');
const validations = require('../middlewares/userValidationsMiddleware');
const authMiddleware = require('../middlewares/authMiddleware');
const guestMiddleware = require('../middlewares/guestMiddleware');

router.get('/register', guestMiddleware, userController.register);
router.post('/register', uploadFile.single('avatar'), validations, userController.processRegister);
router.get('/login', guestMiddleware, userController.login);
router.post('/login', userController.loginProcess);
router.get('/profile', authMiddleware, userController.profile);
router.get('/edit/:id', userController.edit);
router.put('/edit/:id', userController.update);
router.get('/logout', userController.logout);

module.exports = router;