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
				
			
				
				new SMPriority(priorityName:"�ſ쳷��").save()
				new SMPriority(priorityName:"����").save()
				new SMPriority(priorityName:"����").save()
				new SMPriority(priorityName:"����").save()
				new SMPriority(priorityName:"�ſ����").save()
				
				new SMImportant(importantName:"�ſ쳷��").save()
				new SMImportant(importantName:"����").save()
				new SMImportant(importantName:"����").save()
				new SMImportant(importantName:"����").save()
				new SMImportant(importantName:"�ſ����").save()
				
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
