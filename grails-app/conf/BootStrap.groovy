import switchme.SMImportant
import switchme.SMProcess
import switchme.SMScheduler
import switchme.SMThread
import switchme.SMPriority

class BootStrap {

    def init = { servletContext ->
		
		environments{
			production{
				
			}
			
			development{
				
			
				
				new SMPriority(priorityName:"매우낮음").save()
				new SMPriority(priorityName:"낮음").save()
				new SMPriority(priorityName:"보통").save()
				new SMPriority(priorityName:"높음").save()
				new SMPriority(priorityName:"매우높음").save()
				
				new SMImportant(importantName:"매우낮음").save()
				new SMImportant(importantName:"낮음").save()
				new SMImportant(importantName:"보통").save()
				new SMImportant(importantName:"높음").save()
				new SMImportant(importantName:"매우높음").save()
				
				new SMScheduler(schedulerName:"FCFS").save()
				new SMScheduler(schedulerName:"RoundRobin").save()
				new SMScheduler(schedulerName:"Recommender").save()
				
				def p1 = SMProcess.where {
					(title == "process1")
				}
				
				
				
			}
		}
    }
    def destroy = {
    }
}
