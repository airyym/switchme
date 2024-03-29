
<%@ page import="switchme.SMUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SMUser.label', default: 'SMUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-SMUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-SMUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'SMUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'SMUser.password.label', default: 'Password')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${SMUserInstanceList}" status="i" var="SMUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${SMUserInstance.id}">${fieldValue(bean: SMUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: SMUserInstance, field: "password")}</td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${SMUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
