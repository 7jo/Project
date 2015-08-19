<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<style>
#appLoadingIndicator {
	display: table;
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

#cell {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	margin: 0 auto;
}

#wrapper {
	margin: 0 auto;
}

</style>
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
<script type="text/javascript">

	function emailcheck() {
		//alert(document.getElementById("userid").value);
		//alert($("#userid").val());
		$.ajax({
			type : "GET",
			url : "/Tour/validation",
			data : {
				"email" : $("#register-email").val()
			},
			success : emailOk

		});

	}
	
	function pwdcheck() {
		var pwd1 = $("#register-password").val();
		var pwd2 = $("#register-password2").val();
		var result;
		if(pwd1 === pwd2){
			result = '<font color="green">OK !! </font>';
		}else{
			result = '<font color="red">패스워드가 일치하지 않습니다.</font>'
		}
		$("#pwdresult").html(result);

	}

	function emailOk(data) {
		var result;
		if (data != 0) {
			result = '<font color="red">' + $("#register-email").val()
					+ '는 사용불가 합니다.</font>'
		} else {
			result = '<font color="green">' + $("#register-email").val()
					+ '는 사용가능 합니다.</font>'
		}
		$("#resultview").html(result);
	}
</script>
<style>  li { list-style: none;}   </style>
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
									<a href="/Tour/page-logout.jsp">Logout</a>
									<%}else{ %>
									<a href="/Tour/page-login.jsp?islogin=true">Login</a>
									<%} %>
								</h4></li>
						</ul>
					</div>
				</div>

				<div class="collapse navbar-collapse target">

					<ul class="nav navbar-nav ">

						<li><a href="index.jsp">Home</a></li>
						<li><a href="page-team.jsp">About Us</a></li>
						<li><a href="page-tour.jsp">Tour List</a>
						<li><a href="page-register.jsp">Register</a></li>
						<li><a href="page-result.jsp">Search Result</a></li>
					</ul>
				</div>
			</div>
		</div>

	</nav>




	<!-- Page Title -->


	<div id="appLoadingIndicator">
		<div id="cell">
			<div class="section section-breadcrumbs">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1>Register</h1>
						</div>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-sm-5">
							<div class="basic-login">
								<form role="form" action="/Tour/register">
									<div class="form-group">
										<label for="register-username"><i class="icon-user"></i>
											<b>Email</b></label> <input class="form-control"
											id="register-email" name="email" type="text"
											placeholder="" onkeyup="javascript:emailcheck();"><span id="resultview"></span>
									</div>
									<div class="form-group">
										<label for="register-password"><i class="icon-lock"></i>
											<b>Password</b></label> <input class="form-control"
											id="register-password" name="pwd" type="password"
											placeholder="">
									</div>
									<div class="form-group">
										<label for="register-password2"><i class="icon-lock"></i>
											<b>Re-enter Password</b></label> <input class="form-control"
											id="register-password2" name="pwd2" type="password"
											placeholder="" onkeyup="javascript:pwdcheck();"><span id="pwdresult"></span>
									</div>
									<div class="form-group">
										<button type="submit" class="btn pull-right">Register</button>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
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