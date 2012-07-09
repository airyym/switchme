<%@ page import="switchme.SMUser" %>



<div class="fieldcontain ${hasErrors(bean: SMUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="SMUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="15" required="" value="${SMUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SMUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="SMUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="10" required="" value="${SMUserInstance?.password}"/>
	
</div>



