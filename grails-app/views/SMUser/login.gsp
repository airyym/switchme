<%@ page import="switchme.SMUser"%>

<!doctype html>
<html>

<head>
<meta name="layout" content="main">
</head>
<body>
<div class="body">
	<g:form action="doLogin" method="post">
		<div class="container">
			<p>로그인 정보를 입력해주세요:</p>
			<table class="userForm">
				<tr class='prop'>
					<td valign='top' style='text-align: left;' width='20%'><label
						for='username'>UserName:</label></td>
					<td valign='top' style='text-align: left;' width='80%'><input
						id="username" type='text' name='username'
						value='${user?.username}' /></td>
				</tr>
				<tr class='prop'>
					<td valign='top' style='text-align: left;' width='20%'><label
						for='password'>Password:</label></td>
					<td valign='top' style='text-align: left;' width='80%'><input
						id="password" type='password' name='password'
						value='${user?.password}' /></td>
				</tr>

			</table>
			<div class="buttons">
			<span class="formButton"> <input type="submit" class="btn btn-primary" value="로그인"></input>
			</span>
		</div>
		</div>
		
	</g:form>
</div>
</body>
</html>