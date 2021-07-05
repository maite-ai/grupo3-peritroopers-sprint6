const { validationResult } = require('express-validator')
const bcryptjs=require('bcryptjs')
const path = require('path');
const { User } = require('../database/models');
const sequelize = User.sequelize;
const { Op } = require("sequelize");

let userController = {
    register: (req, res) => {
        res.render('register');
    },
    processRegister: (req,res) => {
        const resultValidation = validationResult(req)
        if(resultValidation.errors.length>0){
            return res.render('register',{
                errors:resultValidation.mapped(),
                oldData:req.body
            })
        }
        let userInDB=User.findOne({
            where: {
                email: req.body.email
            }
        })
        if(userInDB){
            return res.render('register', {
                errors:{
                    email:{
                        msg:'Este email ya está registrado'
                    }
                },
                oldData:req.body
            })
        }
        User.create({
            name: req.body.name,
            lastName: req.body.lastName,
            birthDate: req.body.birthDate,
            address: req.body.address,
            email: req.body.email,
            password:bcryptjs.hashSync(req.body.password,10),
            avatar:req.file.filename
        })
        return res.redirect('/users/login')
    },
    edit: async (req, res) => {
        try{
            let user = await User.findByPk(req.params.id);
            console.log(user);
            res.render("userEdit", {user});
        }
        catch(error) {
            res.render('error404');
            console.log(error);
        }        
    },
    update: (req, res) => {
        let user = req.body;
        user.id = req.params.id;
            user.image = req.file ? req.file.filename : req.body.oldImage;    
            if(req.body.image === undefined) {
                user.image = user.oldImage;
            }

            console.log(user.image);
            console.log(user);

        delete user.oldImage;
        User.update({
            name: req.body.name,
            lastName: req.body.lastName,
            address: req.body.address,
            password:bcryptjs.hashSync(req.body.password,10),
            avatar:req.file.filename
        }, {
            where: {
                id: req.params.id
            }
        });
        res.redirect('/profile');
    },
    login: (req, res) => {
        res.render('login')
    },
    loginProcess:(req,res)=>{
        let userToLog=User.findOne({
            where: {
                email: req.body.email
            }
        })
        if(userToLog){
            let passValidation=bcryptjs.compareSync(req.body.password,userToLog.password)
            if(passValidation){
                delete userToLog.password
                req.session.userLogged=userToLog
                if(req.body.remember_me){
                    res.cookie('userEmail',req.body.email,{maxAge: (1000*60)*2})
                }
                return res.redirect('/users/profile')
            }
            return res.render('login',{
                errors:{
                    msg: 'Credenciales inválidas'
                }
            })
        }
        return res.render('login',{
            errors:{
                msg: 'No estás registrado'
            }
        })
    },
    profile:(req,res)=>{
        console.log(req.cookies.userEmail);
        return res.render('profile',{
            user:req.session.userLogged
        })
    },
    logout:(req,res)=>{
        res.clearCookie('userEmail')
        req.session.destroy()
        return res.redirect('/')
    }
}

module.exports = userController