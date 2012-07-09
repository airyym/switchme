
<%@ page import="switchme.SMThread"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<g:set var="entityName"
	value="${message(code: 'SMThread.label', default: 'SMThread')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:javascript library="jquery" plugin="jquery" />
<link rel="javascript" href="${resource(dir: 'js', file: 'json2.js')}"
	type="text/javascript">
</head>
<body>

	<div class="contatiner">
		<h2>할 일 목록</h2>
		<!-- 스레드를 체크박스로 선택해서 스케쥴링 대상을 정한다. -->

		<div class="row-fluid">
			<div class="span12">
				<table id="ThreadTable" class="table table-striped">
					<thead>
						<tr>

							<g:sortableColumn property="title"
								title="${message(code: 'SMThread.title.label', default: '내용')}" />

							<g:sortableColumn property="smPriority"
								title="${message(code: 'SMThread.smPriority.label', default: '우선순위')}" />

							<g:sortableColumn property="smImportant"
								title="${message(code: 'SMThread.smImportant.label', default: '중요도')}" />

							<g:sortableColumn property="runCount"
								title="${message(code: 'SMThread.runCount.label', default: '수행 횟수')}" />



							<g:sortableColumn property="description"
								title="${message(code: 'SMThread.description.label', default: '문맥')}" />

							<g:sortableColumn property="completed"
								title="${message(code: 'SMThread.completed.label', default: '상태')}" />
							<td></td>

						</tr>
					</thead>
					<tbody>
						<g:each in="${SMThreadInstanceList}" status="i"
							var="SMThreadInstance">
							<tr class="edit_tr" id="${SMThreadInstance.id}"
								class="${(i % 2) == 0 ? 'even' : 'odd'}">


								<td class="edit_td"><span id="title_${SMThreadInstance.id}"
									class="text"> ${fieldValue(bean: SMThreadInstance, field: "title")}
								</span> <input type="text"
									value="${fieldValue(bean: SMThreadInstance, field: "title")}"
									class="editbox" id="title_input_${SMThreadInstance.id}"
									style="display: none;"></td>


								<td><g:select id="smPriority" name="${SMThreadInstance.id}"
										from="${switchme.SMPriority.list()}" optionKey="id"
										required="" value="${SMThreadInstance?.smPriority?.id}"
										class="many-to-one" optionValue="priorityName"
										onchange="${remoteFunction(
											action:'updateThread',
											
											 params:'{threadId:escape(this.name), priority:escape(this.value)}'
											)}" />
								</td>

								<td><g:select id="smImportant"
										name="${SMThreadInstance.id}"
										from="${switchme.SMImportant.list()}" optionKey="id"
										required="" value="${SMThreadInstance?.smImportant?.id}"
										class="many-to-one" optionValue="importantName"
										onchange="${remoteFunction(
											action:'updateThread',
											
											 params:'{threadId:escape(this.name), important:escape(this.value)}'
											)}" />
								</td>

								<td>
									${fieldValue(bean: SMThreadInstance, field: "runCount")}
								</td>




								<td class="edit_td"><span id="desc_${SMThreadInstance.id}"
									class="text"> ${fieldValue(bean: SMThreadInstance, field: "description")}
								</span> <input type="text"
									value="${fieldValue(bean: SMThreadInstance, field: "description")}"
									class="editbox" id="desc_input_${SMThreadInstance.id}"
									style="display: none;"></td>

								<g:if test="${SMThreadInstance.completed == true}">
									<td>완료</td>
								</g:if>
								<g:elseif test="${SMThreadInstance.completed == false }">
									<td>미완</td>
								</g:elseif>

								<td><g:link controller="SMThread" action="delete"
										id="${SMThreadInstance.id}" class="btn">삭제</g:link>
							</tr>
						</g:each>
					</tbody>


					<g:link controller="SMThread" action="create">할 일 추가</g:link>
				</table>
			</div>
		</div>

	</div>






	<div class="pagination">
		<g:paginate total="${SMThreadInstanceTotal}" />
	</div>


	<script type="text/javascript">

	Object.size = function(obj) {
	    var size = 0, key;
	    for (key in obj) {
	        if (obj.hasOwnProperty(key)) size++;
	    }
	    return size;
	};
	
		var seletectedThreads = {};

		// 체크한 스레드들만 작업 대상으로 지정한다.
		jQuery(document).ready(function() {
			$('input:checkbox').each(
				function() {
					$(this).click(function() {
						//alert($(this).attr('name'));
						if( $(this).attr('name') in seletectedThreads)
						{
							seletectedThreads[$(this).attr('name')] = false;
							delete seletectedThreads[$(this).attr('name')]
							
						}
						else
							seletectedThreads[$(this).attr('name')] = true;
						//console.log(seletectedThreads);

						adjustSchedule();
					
					});
				}
			);

			adjustSchedule = function(){
				//console.log(seletectedThreads);
				seletectedThreads["scheduler"] = "FCFS";
				var jsonObject=(JSON.stringify(seletectedThreads));
				console.log(jsonObject);

				for (threadId in seletectedThreads)
				{
				
					$.ajax({

						url:"${createLink(controller:'SMThread', action:'scheduling')}",
						dataType:"json",
						data:{targets: jsonObject},
						beforeSend: function(x) {
				            if (x && x.overrideMimeType) {
				              x.overrideMimeType("application/j-son;charset=UTF-8");
				            }
						},
						success:function(data){
							alert("attached to controller");
						}
					});
				}
				
					console.log(threadId);
				//for( i=0 ; i < seletectedThreads.length; i++)
				//	console.log(seletectedThreads[i].value);
			}
			

			// 스레드 추가를 동적으로 하기 위해
			$("#createThreadAjax").click(function(){

				//$("identifier").value = e.responseText
				
				$('#ThreadTable tr:last').after('<tr>1<td></td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>');
				
				
			});
			
			$(".edit_tr").click(function()
			{
				
				var ID=$(this).attr('id');

				$("#title_"+ID).hide();
				$("#title_input_"+ID).show();
				
				$("#desc_"+ID).hide();
				$("#desc_input_"+ID).show();
			}).change(function(){
				

				var ID=$(this).attr('id');
				var desc=$("#desc_input_"+ID).val();
				var title=$("#title_input_"+ID).val();
				if(desc.length > 0 && title.length > 0 && ($("#desc_"+ID).val != desc || $("#title_"+ID) != title))
				{
					$("#desc_"+ID).html(desc);
					$("#title_"+ID).html(title);
				//	alert("need to update db");
					$.ajax({

						url:"${createLink(controller:'SMThread', action:'updateThread')}",
						dataType:'json',
						data:{threadId:ID, description: desc, title:title },
						success:function(data){
							alert("attached to controller");
						}
					});
				}else{
					//alert("Entere something.");
				}
				
				
			});

			// Edit input box click action
			$(".editbox").mouseup(function() 
			{
				return false
			});

			// Outside click action
			$(document).mouseup(function()
			{
				$(".editbox").hide();
				$(".text").show();
			});

			
		});
</script>
</body>
</html>
