
<%@ page import="switchme.SMThread" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SMThread.label', default: 'SMThread')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-SMThread" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-SMThread" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list SMThread">
			
				<g:if test="${SMThreadInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="SMThread.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${SMThreadInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${SMThreadInstance?.runCount}">
				<li class="fieldcontain">
					<span id="runCount-label" class="property-label"><g:message code="SMThread.runCount.label" default="Run Count" /></span>
					
						<span class="property-value" aria-labelledby="runCount-label"><g:fieldValue bean="${SMThreadInstance}" field="runCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${SMThreadInstance?.runTime}">
				<li class="fieldcontain">
					<span id="runTime-label" class="property-label"><g:message code="SMThread.runTime.label" default="Run Time" /></span>
					
						<span class="property-value" aria-labelledby="runTime-label"><g:fieldValue bean="${SMThreadInstance}" field="runTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${SMThreadInstance?.smPriority}">
				<li class="fieldcontain">
					<span id="smPriority-label" class="property-label"><g:message code="SMThread.smPriority.label" default="Sm Priority" /></span>
					
						<span class="property-value" aria-labelledby="smPriority-label"><g:link controller="SMPriority" action="show" id="${SMThreadInstance?.smPriority?.id}">${SMThreadInstance?.smPriority?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${SMThreadInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="SMThread.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${SMThreadInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${SMThreadInstance?.id}" />
					<g:link class="edit" action="edit" id="${SMThreadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
