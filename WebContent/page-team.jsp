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
						<ul>
							<li><h4>
									<%
										String emailId = (String) session.getAttribute("email");
										String url = "page-team.jsp";
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



	<!-- Page Title -->
	<div class="section section-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Our Team</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<!-- Team Member -->
				<div class="col-md-4 col-sm-6">
					<div class="team-member">
						<!-- Team Member Photo -->
						<div class="team-member-image">
							<img src="img/상혁.jpg" alt="Name Surname">
						</div>
						<div class="team-member-info">
							<ul>
								<!-- Team Member Info & Social Links -->
								<li class="team-member-name">차상혁 <!-- Team Member Social Links -->
							
								</li>
								<li>소속 : 한양대학교(ERICA)</li>
								<li>이메일 : northcatcat@gmail.com</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- End Team Member -->
				<div class="col-md-4 col-sm-6">
					<div class="team-member">
						<div class="team-member-image">
							<img src="img/연홍.JPG" alt="Name Surname">
						</div>
						<div class="team-member-info">
							<ul>
								<li class="team-member-name">김연홍 
								</li>
								<li>소속 : 한양대학교(ERICA)</li>
								<li>이메일 : kyh900423@hanyang.ac.kr</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="team-member">
						<div class="team-member-image">
							<img src="img/병문.jpg" alt="Name Surname">
						</div>
						<div class="team-member-info">
							<ul>
								<li class="team-member-name">허병문 
								</li>
								<li>소속 : 국민대학교</li>
								<li>이메일 : ssiass24@gmail.com</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="team-member">
						<div class="team-member-image">
							<img src="img/창훈.jpg" alt="Name Surname">
						</div>
						<div class="team-member-info">
							<ul>
								<li class="team-member-name">이창훈 
								</li>
								<li>소속 : 경기대학교</li>
								<li>이메일 : destiner90@naver.com</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="team-member">
						<div class="team-member-image">
							<img src="img/소윤.jpg" alt="Name Surname">
						</div>
						<div class="team-member-info">
							<ul>
								<li class="team-member-name">신소윤 
								</li>
								<li>소속 : 경기대학교</li>
								<li>이메일 : yrssy@naver.com</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


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
						.write('_$tag_________________________________$tag_____')
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