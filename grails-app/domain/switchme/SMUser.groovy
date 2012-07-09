package switchme

class SMUser {
	
	String username
	String password
	
	
	static hasMany = [threads: SMThread, histories: SMHistory]
	
	
    static constraints = {
		username size:6..15, blank:false, unique:true
		password size:4..10, blank:false, password:true
	 
    }
}
