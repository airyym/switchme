package switchme



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(SMHomeController)
class SMHomeControllerTests {

    void testSomething() {
		def p1 = new SMProcess(title:"process1").save()
		def p2 = new SMProcess(title:"process2").save()
		
		def hc = new SMHomeController()
		hc.params.processId = [(p1.id as String):"on", (p2.id as String) :"on"]
		
		hc.runSM() 
	
    }
}
