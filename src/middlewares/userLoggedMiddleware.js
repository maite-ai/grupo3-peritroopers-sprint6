const db = require('../database/models')

async function userLoggedMiddleware(req, res, next) {
	try{
		res.locals.isLogged = false;

        let UserEmailInCookie = req.cookies.userEmail;
        if(UserEmailInCookie){
            let userFromCookie = await db.User.findOne({where: {email: UserEmailInCookie}})

            if (userFromCookie) {
                req.session.userLogged = userFromCookie;
            }

            if (req.session.userLogged) {
                res.locals.isLogged = true;
                res.locals.userLogged = req.session.userLogged;
            }
        }
        next();
	}
	catch(error){
		console.log(error);
	}
	
}
module.exports=userLoggedMiddleware