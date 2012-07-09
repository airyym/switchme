package switchme

class SMProcess {

	String title
	static hasMany = [threads : SMThread]
	
    static constraints = {
    }
}
