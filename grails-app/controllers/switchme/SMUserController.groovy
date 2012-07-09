package switchme

class SMUserController {

   	def scaffold = SMUser
	   
	def login() {
		render(view:"login")
	}
	
	
	def doLogin = {
		def user = SMUser.findWhere(username:params['username'],
			 password:params['password'])
		session.user = user
			 if (user)
			  redirect(controller:'SMHome',action:'index')
		   else
			   redirect(controller:'SMUser',action:'login')
	}
	
	def logout(){
		session.user = null
		redirect(controller:'SMThread',action:'list')
	}
	
	def signup(){
		[SMUserInstance: new SMUser(params)]
	}
}
