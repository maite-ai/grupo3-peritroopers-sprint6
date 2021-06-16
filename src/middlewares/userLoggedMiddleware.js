const User=require('../model/userModel')
function userLoggedMiddleware(req,res,next){
    res.locals.islogged=false
    let userEmailInCookie=req.cookies.userEmail
    let userFromCookie=User.findByField('email',userEmailInCookie)
    if(userFromCookie){
        req.session.userLogged=userFromCookie
    }
    if(req.session.userLogged){
        res.locals.isLogged=true
        res.locals.userLogged=req.session.userLogged
    }
    next()
}
module.exports=userLoggedMiddleware