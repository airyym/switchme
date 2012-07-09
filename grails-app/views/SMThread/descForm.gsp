


<g:form action="">

	<div
		class="fieldcontain ${hasErrors(bean: SMThreadInstance, field: 'description', 'error')} ">
		<h1>작업 내용 저장</h1>
		<label for="description"> <g:message
				code="SMThread.description.label" default="Description" />
		</label>
		<g:textField name="description"
			value="${SMThreadInstance?.description}" />
	</div>

	<fieldset class="buttons">
		<g:submitButton name="create"
			value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</fieldset>
</g:form>