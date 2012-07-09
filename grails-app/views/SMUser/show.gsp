
<%@ page import="switchme.SMUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SMUser.label', default: 'SMUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-SMUser" class="content scaffold-show" role="main">
			<h1>사용자 정보</h1>
			
			<ol class="property-list SMUser">
			
				<g:if test="${SMUserInstance?.username}">
				
					<span id="username-label" class="property-label"><g:message code="SMUser.username.label" default="Username" /></span>
					
						: <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${SMUserInstance}" field="username"/></span>
					
				
				</g:if>
			
				<br/>
				<g:if test="${SMUserInstance?.password}">
				
					<span id="password-label" class="property-label"><g:message code="SMUser.password.label" default="Password" /></span>
					
						: <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${SMUserInstance}" field="password"/></span>
					
				</g:if>
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${SMUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${SMUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
