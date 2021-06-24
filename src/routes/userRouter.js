const express = require('express');

const router = express.Router();

const userController = require('../controller/usersController')

router.get('/:id', userController.detail)
router.get('/create', userController.add)
router.post('/create', userController.create)
router.get('/edit/:id', userController.edit)
router.put('/edit/:id', userController.update)

module.exports = router;