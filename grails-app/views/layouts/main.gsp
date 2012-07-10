<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>

				</a> 

				<div class="nav-collapse">

					<ul class="nav">

						<li><g:link controller="SMHome" action="index">홈</g:link></li>

						<g:if test="${session.user}">
							<li><g:link controller="SMThread" action="list">할일 목록</g:link></li>
							<li><g:link controller="SMUser" action="logout">로그아웃</g:link></li>
						
						</g:if>

						<g:elseif test="${session.user == null}">
							<li><g:link controller="SMUser" action="login">로그인</g:link></li>
							<li><g:link controller="SMUser" action="signup">가입하기</g:link></li>
							
							
							
						</g:elseif>
						
						


					</ul>

				</div>
				<!--/.nav-collapse -->

			</div>

		</div>

	</div>

	<g:layoutBody />
	<br/><br/>
	<div class="footer" role="contentinfo">
		<div class="container">
		<h2>SwitchMe!는 현재 0.1 베타 상태로 사용자 정보의 어떠한 것도 책임지지 않습니다. <br>주의해서 사용해 주세요.</h2>
		<br/>문의 사항이나 건의 사항은 <a href="mailto:airyym@naver.com">이 곳</a>으로 메일 주시기 바랍니다. 
		<br/>
		Switchme! 소스코드: <a href="https://github.com/airyym/switchme.git">https://github.com/airyym/switchme.git</a>
		
		</div>	
	</div>
	
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<r:layoutResources />
</body>
</html>