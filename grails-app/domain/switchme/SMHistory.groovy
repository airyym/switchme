package switchme

class SMHistory {
	
	Long priority
	Long important
	Long runCount
	Long runTime
	Long choose
	
	static belongsTo = [user:SMUser]
    static constraints = {
    }
}
