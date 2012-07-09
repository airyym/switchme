package switchme
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.*

import org.springframework.dao.DataIntegrityViolationException


class SMThreadController {
	
	def beforeInterceptor = [action:this.&checkUser]
		
	
	def checkUser() {
		if(!session.user) {
		// i.e. user not logged in
			redirect(controller:'SMUser',action:'login')
			return false
		}
		}

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
		//println "good?"
        redirect(action: "list", params: params)
    }

    def list() {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		List threads =SMThread.findAll("from SMThread as t where t.user = ?", [session.user]) 
		
        [SMThreadInstanceList: threads, SMThreadInstanceTotal: threads.size()]
    }

    def create() {
		[SMThreadInstance: new SMThread(params)]
    }

    def save() {
		
		//print params
		
		
        def SMThreadInstance = new SMThread(params)
		

		
		SMThreadInstance.user = session.user
		
        if (!SMThreadInstance.save(flush: true)) {
            render(view: "create", model: [SMThreadInstance: SMThreadInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'SMThread.label', default: 'SMThread'), SMThreadInstance.id])
        redirect(action: "list")
    }

    def show() {
        def SMThreadInstance = SMThread.get(params.id)
        if (!SMThreadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
            return
        }

        [SMThreadInstance: SMThreadInstance]
    }

    def edit() {
        def SMThreadInstance = SMThread.get(params.id)
        if (!SMThreadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
            return
        }

        [SMThreadInstance: SMThreadInstance]
    }

    def update() {
        def SMThreadInstance = SMThread.get(params.id)
        if (!SMThreadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (SMThreadInstance.version > version) {
                SMThreadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'SMThread.label', default: 'SMThread')] as Object[],
                          "Another user has updated this SMThread while you were editing")
                render(view: "edit", model: [SMThreadInstance: SMThreadInstance])
                return
            }
        }

        SMThreadInstance.properties = params

        if (!SMThreadInstance.save(flush: true)) {
            render(view: "edit", model: [SMThreadInstance: SMThreadInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'SMThread.label', default: 'SMThread'), SMThreadInstance.id])
        redirect(action: "show", id: SMThreadInstance.id)
    }

    def delete() {
		//println params.id
        def SMThreadInstance = SMThread.get(params.id)
        if (!SMThreadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
            return
        }
 
        try {
            SMThreadInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'SMThread.label', default: 'SMThread'), params.id])
            redirect(action: "list")
        }
    }
	
	def runSM(){
		
		def history = new SMHistory(priority:1, runCount:2, runTime:20, choose:1)
		
		//println history.runTime
		
		def user = SMUser.find(session.user)
		//println user.username
		user.addToHistories(history)
		def histories = SMHistory.findAll()
		
		//println histories.size()
		/*
		def threadIds = params.list('threadId').get(0)
		//print threadIds
		threadIds.each() { threadId ->
			if (threadId.key.isLong() && "on".equals(threadId.value)) {
			  def smThread = SMThread.get(threadId.key.toLong())
			  //println smThread.title
			}
		  }
		
		session['threadId'] = 3
		redirect(action: "running", params:[currentProcess: 1, currentThread: 1])
		*/
	}
	
	
	def running(){
		//println params
		//println session.threadId
		
		
		
		render(view:"running")
		
		
	}
	
	def updateThread(){
		//println "updateThread!"
		//println params
		
		def SMThreadInstance = SMThread.get(params.threadId)
		
		if( params.priority > 0)
		{
			def SMPriorityInstance = SMPriority.get(params.priority)
			SMThreadInstance.smPriority = SMPriorityInstance
		}
		
		if( params.important> 0)
		{
			def SMImportantInstance = SMImportant.get(params.important)
			SMThreadInstance.smImportant = SMImportantInstance
		}
		
		if(params.description){
			SMThreadInstance.description = params.description
		}
		
		if(params.title){
			SMThreadInstance.title = params.title
		}
		
		if (SMThreadInstance.save(flush: false)) {
			//println "Success Update!"
			return
		}
		
		//print SMThreadInstance
	} 
	
	def createThreadAjax(){
		//print "ajax"
		render(txt:"ajax!!!", contentType:'text/html')
	}
	
	def postpone(){
		//println "postpone"
		//println session.threadId
		def SMThreadInstance = SMThread.get(session.threadId)
		
		//println SMThreadInstance?.description
		render(view: "descForm", model: [SMThreadInstance: SMThreadInstance])
	}
	
	def scheduling(){
		JSONObject parsedList = JSON.parse(params.targets);
		parsedList.sort()
		parsedList.each{ parsedResult->
			//println parsedResult.get
		}
	}
}
