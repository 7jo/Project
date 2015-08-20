<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Secret_Tour</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/icomoon-social.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="css/leaflet.css" />
		<!--[if lte IE 8]>
		    <link rel="stylesheet" href="css/leaflet.ie.css" />
		<![endif]-->
		<link rel="stylesheet" href="css/main.css">

        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style>  li { list-style: none;}   </style>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        


	<!-- Navigation & Logo-->
	<%
		String url = request.getParameter("url");
		String bl = request.getParameter("islogin");
		if(bl.equals("false")){
	%>
	<script type="text/javascript">
	alert("로그인 실패 비번 아이디 다시 확인");
	</script>
	<%
		}else{
	%>
	<script type="text/javascript">
	alert(url);
	</script>
	<%
		}
	%>
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
						<li class="logo-wrapper"><a href="index.jsp"> <img
								src="img/s1.png"><img
								src="img/t2.png">
						</a></li>
						<ul>
							<li><h4>
									<%
								String emailId = (String)session.getAttribute("email");
								String result;
								if(emailId !=null){
								
							%>
<<<<<<< HEAD
											<a href="/Tour/page-logout.jsp">로그아웃</a>
=======
									<a href="/Tour/page-logout.jsp?url=<%=url%>">Logout</a>
>>>>>>> branch 'master' of https://github.com/7jo/Project.git
									<%}else{ %>
<<<<<<< HEAD
									<a href="/Tour/page-login.jsp?islogin=true">로그인</a>
=======
									<a href="/Tour/page-login.jsp?islogin=true&url=<%=url%>">Login</a>
>>>>>>> branch 'master' of https://github.com/7jo/Project.git
									<%} %>
								</h4></li>
						</ul>
					</div>
				</div>

				<div class="collapse navbar-collapse target">

					<ul class="nav navbar-nav ">

						<li><a href="index.jsp">Home</a></li>
						<li><a href="page-team.jsp">About Us</a></li>
						<li><a href="page-tour.jsp">Tour List</a></li>
						<li><a href="page-register.jsp">Register</a></li>
						<li><a href="page-result.jsp">Search Result</a></li>
					</ul>
				</div>
			</div>
		</div>

	</nav>




        <!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Login</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-5">
					<div class="basic-login">
						<form role="form" action="/Tour/login">
						<input type="hidden" name="url" value="<%=url%>">
							<div class="form-group">
								<label for="login-username"><i class="icon-user"></i> <b>Username
										or Email</b></label> <input class="form-control" id="login-username"
									name="ck_email" type="text" placeholder="">
							</div>
							<div class="form-group">
								<label for="login-password"><i class="icon-lock"></i> <b>Password</b></label>
								<input class="form-control" id="login-password" name="ck_pwd"
									type="password" placeholder="">
							</div>
							<div class="form-group">
								<label class="checkbox"> <input type="checkbox">
									Remember me
								</label> <a href="page-password-reset.html" class="forgot-password">Forgot
									password?</a>
								<button type="submit" class="btn pull-right">Login</button>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-7 social-login">
					<p>Or login with your Facebook or Twitter</p>
					<div class="social-login-buttons">
						<a href="#" class="btn-facebook-login">Login with Facebook</a> <a
							href="#" class="btn-twitter-login">Login with Twitter</a>
					</div>
					<div class="clearfix"></div>
					<div class="not-member">
						<p>
							Not a member? <a href="page-register.jsp">Register here</a>
						</p>
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
					<h3>Navigate</h3>
					<ul class="no-list-style footer-navigate-section">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="page-team.jsp">About Us</a></li>
						<li><a href="page-tour.jsp">Tour List</a>
						<li><a href="page-register.jsp">Register</a></li>
						<li><a href="page-result.jsp">Search Result</a></li>
					</ul>
				</div>

				<div class="col-footer col-md-4 col-xs-6">
					<h3>Contacts</h3>
					<p class="contact-us-details">
						<b>Address:</b> 123 Fake Street, LN1 2ST, London, United Kingdom<br />
						<b>Phone:</b> +44 123 654321<br /> <b>Fax:</b> +44 123 654321<br />
						<b>Email:</b> <a href="mailto:getintoutch@yourcompanydomain.com">getintoutch@yourcompanydomain.com</a>
					</p>
				</div>
				<div class="col-footer col-md-2 col-xs-6">
					<h3>Stay Connected</h3>
					<ul class="footer-stay-connected no-list-style">
						<li><a href="http://www.facebook.com" class="facebook"></a></li>
						<li><a href="http://www.twitter.com" class="twitter"></a></li>
						<li><a href="http://plus.google.com" class="googleplus"></a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="footer-copyright">&copy; 2015 All
						rights reserved.</div>
				</div>
			</div>
		</div>
	</div>
        <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
        <script src="js/jquery.fitvids.js"></script>
        <script src="js/jquery.sequence-min.js"></script>
        <script src="js/jquery.bxslider.js"></script>
        <script src="js/main-menu.js"></script>
        <script src="js/template.js"></script>

    </body>
</html>
