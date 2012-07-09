<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

.editbox {
	font-size: 14px;
	width: 270px;
	background-color: #ffffcc;
	border: solid 1px #000;
	padding: 4px;
}

.edit_tr:hover {
	background: url(edit.png) right no-repeat #80C8E5;
	cursor: pointer;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>

	<div id="page-body" role="main">
		<g:if test="${currentUser}">
			<!-- Welcome! ${currentUser.username} -->
		</g:if>
		<g:elseif test="${currentUser == null}">
			<g:link controller="SMUser" action="login">로그인</g:link>
			<g:link controller="SMUser" action="signup">가입하기</g:link>
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
</body>
</html>
