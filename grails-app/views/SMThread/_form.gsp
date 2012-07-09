<%@ page import="switchme.SMThread" %>



<div class="fieldcontain ${hasErrors(bean: SMThreadInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="SMThread.title.label" default="내용" />
		
	</label>
	<g:textField name="title" value="${SMThreadInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SMThreadInstance, field: 'smPriority', 'error')} required">
	<label for="smPriority">
		<g:message code="SMThread.smPriority.label" default="우선순위" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="smPriority" name="smPriority.id" from="${switchme.SMPriority.list()}" optionKey="id" optionValue="priorityName" required="" value="${SMThreadInstance?.smPriority?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: SMThreadInstance, field: 'smImportant', 'error')} required">
	<label for="smPriority">
		<g:message code="SMThread.smImportant.label" default="중요도" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="smImportant" name="smImportant.id" from="${switchme.SMImportant.list()}" optionKey="id" optionValue="importantName" required="" value="${SMThreadInstance?.smImportant?.id}" class="many-to-one"/>
</div>


