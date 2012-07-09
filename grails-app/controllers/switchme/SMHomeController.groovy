package switchme

import java.util.List;
import org.springframework.web.servlet.ModelAndView
import org.apache.commons.math.linear.Array2DRowRealMatrix;
import org.apache.commons.math.linear.ArrayRealVector;
import org.apache.commons.math.linear.DecompositionSolver;
import org.apache.commons.math.linear.LUDecompositionImpl;
import org.apache.commons.math.linear.RealMatrix;
import org.apache.commons.math.linear.RealVector;
import org.apache.commons.math.linear.AbstractRealMatrix;

class SMHomeController {

	def smThreads
	List smProcesses
	List smHistories
    def index(){
		
		def bestCandidate = 0
		
		def user
		if(session.user)
		{
			smThreads = SMThread.findAll("from SMThread as t where t.user = ? and t.completed=0", [session.user])
			smHistories = SMHistory.findAll("from SMHistory as h where h.user = ? ", [session.user])
			
			if(smHistories.size < 5) // 아직 사용자가 이력을 남기지 않은 경우
			{
				// 기본 데이터를 사용한다.
				smHistories = SMHistory.findAll("from SMHistory as h where h.user =  1", )
			}
			 
			////println smHistories.size
			
			// 이전 사용자의 이력을 바탕으로 행렬 생성
			def x = new Array2DRowRealMatrix(smHistories.size(),3);
			def y = new Array2DRowRealMatrix(smHistories.size(),1);
			
			int i = 0
			smHistories.each{
				
				x.setEntry(i, 0, it.priority)
				x.setEntry(i, 1, it.runCount)
				x.setEntry(i, 2, it.important)
				
				y.setEntry(i,0,it.choose)
				
				i++
				
			} 			
			// Linear Regression 연산 수행
			def beta = x.transpose().multiply(x).inverse()*x.transpose().multiply(y)
				
			
			def maxValue=0.0
			def currValue=0.0
			i=0
			
			// 현재 사용자의 할 일 목록과 연산 결과 나온 해를 곱연산하여 가장 결과치가 높은 할 일 목록 추출
			smThreads.each {
				
				def n = new Array2DRowRealMatrix(1,3);
				n.setEntry(0, 0, it.smPriority.id)
				n.setEntry(0, 1, it.runCount)
				n.setEntry(0, 2, it.smImportant.id)
				
				currValue = n.multiply(beta).getEntry(0, 0);
				////println currValue
				if(currValue > maxValue)
				{
					maxValue = currValue
					bestCandidate = i
				}
				i++
				
			}
			return new ModelAndView("/SMHome/index", [currentUser:session.user , threadList : smThreads[bestCandidate]])
		}
		  
		
		
		
		////println bestCandidate
		return new ModelAndView("/SMHome/index")
	}
	
	def runSM(){
		
		def user = SMUser.find(session.user)
		def smThread =  SMThread.get(params.id)
		
		////println smThread
		
		def history = new SMHistory(priority:smThread.smPriority.id, runCount:smThread.runCount, important:smThread.smImportant.id, runTime:20, choose:1)
		
		//println history
		
		//println user.username
		user.addToHistories(history)
		
		 
		session.currentThread = smThread.id
		//println session.currentThread
		redirect(action: "running", params:[currentThread: smThread.id])
	}
	
	def skip(){
		//println params
		def user = SMUser.find(session.user)
		def smThread =  SMThread.get(params.id)
		def history = new SMHistory(priority:smThread.smPriority.id, runCount:smThread.runCount, important:smThread.smImportant.id, runTime:20, choose:0)
		user.addToHistories(history)
		redirect(action:"index")
	}
	
	def running(){
		//println params
		
		render(view:"running")
		
		
	}
	
	def postponeThread(){
		//println params
		//println session.currentThread
		def smThread =  SMThread.get(session.currentThread)
		
		smThread.description = params.description
		smThread.runCount++
		
		smThread.save()
		
		redirect(action:"index")
	
	}
	
	def completeThread(){
		def smThread =  SMThread.get(session.currentThread)
		smThread.description = params.description
		smThread.runCount++
		smThread.completed = true
		smThread.save()
		redirect(action:"index")
	}
}
