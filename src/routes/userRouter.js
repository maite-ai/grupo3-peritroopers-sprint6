const express = require('express');

const router = express.Router();

const userController = require('../controller/usersController')

/*router.get('/:id', userController.detail)
router.get('/create', userController.add)
router.post('/create', userController.create)
router.get('/edit/:id', userController.edit)
router.put('/edit/:id', userController.update)
*/
router.get('/register', userController.register);
//router.post('/register', uploadFile.single('avatar'), controller.processRegister);
router.get('/login', userController.login);
router.post('/login', userController.loginProcess);
router.get('/profile/', userController.profile);
router.get('/logout/', userController.logout)

module.exports = router;