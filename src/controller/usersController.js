const path = require('path');
const DB = require('../database/models');
const sequelize = DB.sequelize;
const { Op } = require("sequelize");

module.exports = {
    detail: (req, res) => {
        DB.User
            .findByPk(req.params.id)
            .then(user => {
                res.render('profile.ejs', {user})
            })
    },
    add: (req, res) => {
        Promise
            .all(User.findAll())
            .then((allusers) => {
                return res.render(path.resolve(__dirname, '..', 'views', 'register'), {allUsers})
            })
            .catch(error => res.send(error))
    },
    create: (req, res) => {
        DB.User
            .create({
                name: req.body.name,
                lastName: req.body.lastName,
                birthDate: req.body.birthDate,
                address: req.body.address,
                avatar: req.body.avatar,
                email: req.body.email,
                password: req.body.password
                })
            .then(user => {
                return res.status(200).json({
                    data: user,
                    status: 200,
                    created: 'Ok'
                })
            })
            .catch(error => res.send(error))
    },
    edit: (req, res) => {
        Promise
        .all(User.findByPk(req.params.id))
        .then((user) => {
            return res.render(path.resolve(__dirname, '..', 'views',  'editUser'), {user})})
        .catch(error => res.send(error))
    },
    update: (req, res) => {
        DB.User
            .update({
                name: req.body.name,
                lastName: req.body.lastName,
                birthDate: req.body.birthDate,
                address: req.body.address,
                avatar: req.body.avatar,
                password: req.body.password
                }, {
                where: {
                    id: req.params.id,
                }
            })
            .then(user => {
                return res.status(200).json({
                    data: user,
                    status: 200,
                    updated: 'Ok'
                })
            })
    }
}