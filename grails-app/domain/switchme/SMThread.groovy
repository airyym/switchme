package switchme

class SMThread {

	String title
	int	   runCount // run time count of Thread
	Long   runTime // run time length of Thread
	String description
	Date   dateCreated
	Date   lastUpdated
	boolean completed
	
	SMPriority smPriority
	SMImportant smImportant
	
	static belongsTo = [user:SMUser]
	
    static constraints = {
		title blank:false
		description nullable:true
		runCount nullable:true
		runTime nullable:true
		
    } 
}
