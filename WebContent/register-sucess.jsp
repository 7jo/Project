<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>	
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Secret_Tour</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/icomoon-social.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/leaflet.css" />
<!--[if lte IE 8]>
          <link rel="stylesheet" href="css/leaflet.ie.css" />
      <![endif]-->
<link rel="stylesheet" href="css/main.css">

<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<style>
li {
	list-style: none;
}
</style>
<style type="text/css">
h {
	font-size: 45px;
}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

	<!-- Navigation & Logo-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="mainmenu-wrapper">
			<div class="container-fluid">
				<div class="menuextras">
					<div class="extras">

						<button type="button" data-target=".target" data-toggle="collapse"
							class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<li class="logo-wrapper"><a href="index.jsp"> <!-- <img
                        src="img/s1.png"> <img
                        src="img/tour.png">-->
								<h1>
									<h> Secret Tour </h>
								</h1>
						</a></li>
						</ul>
						<ul>
							<li><h4>
									<%
										String emailId = (String) session.getAttribute("email");
										String url = "index.jsp";
										String result;
										if (emailId != null) {
									%>
									<%=emailId%>님 환영합니다.&nbsp; &nbsp;<a
										href="/Tour/page-logout.jsp?url=<%=url%>">로그아웃</a>
									<%
										} else {
									%>
									<a href="/Tour/page-login.jsp?islogin=true&url=<%=url%>">로그인</a>
									<%
										}
									%>
								</h4></li>

						</ul>
					</div>
				</div>

				<div class="collapse navbar-collapse target">

					<ul class="nav navbar-nav ">
						<li><a href="index.jsp">홈 </a></li>
						<li><a href="/Tour/notice">공지사항 </a></li>
						<li><a href="page-team.jsp">프로젝트 맴버 </a></li>
						<li><a href="page-result.jsp">여행 추천 </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="nav_underbar"></div>

	</nav>





	<%
		String email = (String) request.getAttribute("email");
		String pwd = (String) request.getAttribute("pwd");
	%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="border-style: inherit;" align="center">
		<h2 align="center">
			회원 가입 <b>완료 
		</h2>

		<table border="1" width="600" height="300">
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/img/oksign.png"></td>
				<td align="center" width="300">
					<h3 style="font: bold;">
						축하합니다.<br> 회원가입이 완료되었습니다.
					</h3> <br> <br> <br> <br> <br> <a
					href="/Tour/page-login.jsp?islogin=true"><button type="button">로그인
							페이지</button></a> <a href="/Tour/index.jsp"><button type="button">메인
							페이지</button></a>
				</td>
			</tr>
		</table>
	</div>


	<!-- Call to Action Bar -->
	<div class="section section-white">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="calltoaction-wrapper">


						<!-- /.search-form -->

						<!-- <h1>
                     <a href="http://www.sohohosting.co.uk/">여기다가 뭘 쓰지?</a>
                  </h1>
                   -->
						<p>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- End Call to Action Bar -->



	<!-- Footer -->
	<div class="footer">
		<div class="container">
			<div class="row">

				<div class="col-footer col-md-3 col-xs-6">
					<h3>메뉴</h3>

					<ul class="no-list-style footer-navigate-section">
						<li><a href="index.jsp">홈 </a></li>
						<li><a href="/Tour/notice">공지사항 </a></li>
						<li><a href="page-team.jsp">프로젝트 맴버 </a></li>
						<li><a href="page-result.jsp">여행 추천 </a></li>
					</ul>

				</div>

				<div class="col-footer col-md-4 col-xs-6">
					<h3>오시는 길</h3>
					<p class="contact-us-details">
						<b>주소: </b> 경기도 안산시 상록구 한양대학로 55, 4공학관 1층 SMaSH <br /> <b>연락처:
						</b> +82 031 400 4040 <br /> <b>메일주소: </b> <a href="">kyh900423@hanyang.ac.kr</a>
					</p>
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="footer-copyright">&copy; 2015 All rights
						reserved.</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascripts -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-1.9.1.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
	<script src="js/jquery.fitvids.js"></script>
	<script src="js/jquery.sequence-min.js"></script>
	<script src="js/jquery.bxslider.js"></script>
	<script src="js/main-menu.js"></script>
	<script src="js/template.js"></script>

</body>
</html>