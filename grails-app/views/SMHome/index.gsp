<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to SwitchMe!</title>

</head>
<body>
	
	<div class="container">
		<div id="page-body" role="main">
			<g:if test="${currentUser}">
				<!-- Welcome! ${currentUser.username} -->
			</g:if>
			<g:elseif test="${currentUser == null}">
				<g:link controller="SMUser" action="login">로그인</g:link>
				<g:link controller="SMUser" action="signup">가입하기</g:link>
				<br/>
				SwitchMe! 기계학습을 통해서 사용자의 할 일 목록 중에 가장 다음 할 일로 선택할 가능성이
								높은 항목을 추천해드립니다. <br/>사용자의 이전 행위를 기록하여 다음 행동을 판단하는데 사용하기 때문에
								더욱 많은 행동을 할 수록 정확도가 향상됩니다. 
			</g:elseif>
	
			<br />
			
			<g:if test="${threadList}">
				<h1>다음과 같은 할 일이 추천되었습니다</h1>
				<g:each in="${threadList}" var="thread">
	
					<g:if test="${threadList?.title}">
						<span id="title-label"
							class="property-label"><g:message
									code="SMThread.title.label" default="내용	-	" /></span> <span
							class="property-value" aria-labelledby="title-label"><g:fieldValue
									bean="${thread}" field="title" /></span>
					</g:if>
	
	
	
					<br/>
					<g:if test="${threadList?.smPriority}">
						<span id="smPriority-label"
							class="property-label"><g:message
									code="SMThread.smPriority.label" default="우선순위	-	" /></span> <span
							class="property-value" aria-labelledby="smPriority-label">
								${thread?.smPriority?.priorityName?.encodeAsHTML()}
						</span>
					</g:if>
	
					<br/>
					<g:if test="${threadList?.smImportant}">
						<span id="smPriority-label"
							class="property-label"><g:message
									code="SMThread.smImportant.label" default="중요도	-	" /></span> <span
							class="property-value" aria-labelledby="smImportant-label">
								${thread?.smImportant?.importantName?.encodeAsHTML()}
						</span>
					</g:if>
	
					<br/>
					<g:if test="${threadList?.runCount}">
						<span id="runCount-label"
							class="property-label"><g:message
									code="SMThread.runCount.label" default="수행횟수		-	" /></span> <span
							class="property-value" aria-labelledby="runCount-label"><g:fieldValue
									bean="${thread}" field="runCount" /></span>
					</g:if>
	
					
					<br/>
					<g:if test="${threadList?.description}">
						<span id="description-label"
							class="property-label"><g:message
									code="SMThread.description.label" default="내용	-	" /></span> <span
							class="property-value" aria-labelledby="description-label"><g:fieldValue
									bean="${thread}" field="description" /></span>
					</g:if>
	
					<br/>
				</g:each>
	
				<g:link action="runSM" class="btn" name="Run" id="${threadList.id}">시작</g:link>
				<g:link action="skip" class="btn btn-inverse" name="Skip"
					id="${threadList.id}">건너뛰기</g:link>
	
	
	
			</g:if>
			<g:elseif test="${threadList == 0}">
				할 일을 추가해주세요
			</g:elseif>
		</div>
	</div>
</body>
</html>
