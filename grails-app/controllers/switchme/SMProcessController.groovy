package switchme

import org.springframework.web.servlet.ModelAndView

class SMProcessController {
	
	//def afterInterceptor = [action:this.&adjustSchedule]
	
	List smProcesses
    def index(){
		smProcesses = SMProcess.list()
		
		return new ModelAndView("/SMProcess/list", [processList : smProcesses])
		
		/*
		render{
			for ( p in smProcesses){
				div(id:p.id, p.title)
			}
		}
		*/
	}
	
	def show(){
		
		def process = SMProcess.get(params.id)
		return new ModelAndView("/SMProcess/show", [process : process])
		
		
		
		/*
		render{
			div(id:p.id, p.title)
		}*/
	}
	
	def edit(){
		
	}
	
	def create(){
		println "create"	
	}
	
	def save(){
		println "save"
		
		new SMProcess(params).save()
	}
	
	def createSMThread(){
		def processId = params.id
		
		def parent = SMProcess.get( processId);
		
		parent.addToThreads(new SMThread(title:"thread of parent" + processId)).save()
	}
	
}
