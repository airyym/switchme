<%@ page import="switchme.SMThread"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
</head>

<body onload="getClock()">



	<g:form action="postActionh" method="post">
		<div
			class="fieldcontain ${hasErrors(bean: SMThreadInstance, field: 'description', 'error')} ">
			<h1>할 일 중...</h1>
			<div id="clock"></div>
			<br /> <label for="description"> <g:message
					code="SMThread.description.label" default="문맥저장" />
			</label>
			<g:textField name="description"
				value="${SMThreadInstance?.description}" />
		</div>
		<g:actionSubmit class="btn" value="완료" action="completeThread" />
		<g:actionSubmit class="btn" value="보류" action="postponeThread" />
	</g:form>


	<script type="text/javascript">
		function getClock()
		{	
			alert("cock!");
			var clock = new Date();
			var hours12;
			var ampm = "AM";
			var hours24 = clock.getHours();
			var minutes = clock.getMinutes();
			var seconds = clock.getSeconds();
			if (hours24>=13)
			{
				hours12 = hours24 – 12;
				ampm = "PM";
				}
			else if (hours24==12)
			{
				hours12 = 12;
				ampm = "PM";
			}
			else if (hours24==0)
			{
				hours12 = 12;
			}
			else
			{
				hours12 = hours24;
			}
			if(hours12<10)
			{
				hours12 ="0″+hours12;
			}
			if (minutes<10)
			{
				minutes = "0″ + minutes;
			}
			if(seconds<10)
			{
				seconds ="0″+seconds;
			}
			var time = hours12 + " : " + minutes +" : "+ seconds + " " + ampm;
			document.title = time;
			document.getElementById("clock").innerHTML = time;
			timer = setTimeout("getClock()",1000);
		}
</script>
</body>
</html>