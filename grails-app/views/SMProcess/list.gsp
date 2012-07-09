

<!--<g:sortableColumn property="title" title="Title"/>-->

<g:each in ="${processList}" var="process">
	${fieldValue(bean:process, field:'title') }
	<g:link action="createSMThread" id="${process.id}">
	스레드 등록<br/>
	</g:link>
</g:each>

<g:link action="create">
	프로세스 등록<br/>
</g:link>

