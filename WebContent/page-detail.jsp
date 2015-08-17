<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
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
<title>Gyeonggi_Tour</title>
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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function submit() {
		/* alert($("#userid").text());
		alert($("#place").text());
		alert($("#comment").val()); */
		var s = $("#comment").val();
		if (s == '') {
			alert("글자를 입력해주세요!!");
		} else {
			$.ajax({
				type : "POST",
				url : "/Tour/update",
				data : {
					"user" : $("#userid").text(),
					"pid" : $("#pid").text(),
					"comment" : $("#comment").val()
				},
				success : update
			});
		}
	}

	function js_yyyy_mm_dd_hh_mm_ss() {
		now = new Date();
		year = "" + now.getFullYear();
		month = "" + (now.getMonth() + 1);
		if (month.length == 1) {
			month = "0" + month;
		}
		day = "" + now.getDate();
		if (day.length == 1) {
			day = "0" + day;
		}
		hour = "" + now.getHours();
		if (hour.length == 1) {
			hour = "0" + hour;
		}
		minute = "" + now.getMinutes();
		if (minute.length == 1) {
			minute = "0" + minute;
		}
		second = "" + now.getSeconds();
		if (second.length == 1) {
			second = "0" + second;
		}
		return hour + ":" + minute + ":" + second;
	}

	function update(data) {
		alert("성공!!");
		var result;
		var date = js_yyyy_mm_dd_hh_mm_ss();
		result = '<td>' + $("#userid").text() + '</td><td>'
				+ $("#comment").val() + '</td><td>' + date + '</td>';
		$("#comment_table").html(result);
	}
</script>
</head>
<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->


	<!-- Navigation & Logo-->

	<nav class="fixed-nav-bar">

		<div class="mainmenu-wrapper">
			<div class="container">
				<div class="menuextras">
					<div class="extras">
						<ul>
							<li><h5>
									<a href="page-login.jsp">Login</a>
								</h5></li>
						</ul>
					</div>
				</div>
				<nav id="mainmenu" class="mainmenu">
					<ul>
						<li class="logo-wrapper"><a href="index.jsp"> <img
								src="img/7.png">
						</a></li>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="page-team.jsp">About Us</a></li>
						<li><a href="page-tour.jsp">Tour List</a></li>
						<li><a href="page-result.jsp">Search Result</a></li>
						<li><a href="page-register.jsp">Register</a></li>
					</ul>
				</nav>
			</div>
		</div>

	</nav>


	<!-- Page Title -->
	<div class="section section-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Detail Information</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<%
				String pname = request.getAttribute("pname").toString();
				String pid = request.getAttribute("pid").toString();
				String imgSrc = request.getAttribute("pimg").toString();
				String id = (String) session.getAttribute("id");
				if (id == null)
					id = "";
			%>
			<h2 id="place"><%=pname%></h2>
			<p hidden id="pid"><%=pid%></p>
			<div class="row">
				<!-- Open Vacancies List -->
				<div class="team-member-image">
					<img alt="place" src="${pageContext.request.contextPath}/img/<%=imgSrc %>.png" />
				</div>
				<br>
				<div class="col-md-8">
					<table>
						<c:forEach items="${mlist}" var="reply">
							<tr>
								<td>${reply.user}</td>
								<td>${reply.comment}</td>
								<td>${reply.date}</td>
							</tr>
						</c:forEach>
						<tr id="comment_table"></tr>
					</table>
					<br> <br>
					<table border=1>
						<tr>
							<td>이름</td>
							<td id="userid"><%=id%></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="comment" rows="4" cols="50"></textarea></td>
						</tr>
						<tr>
							<td colspan="1"></td>
							<td><input type=button value="등록"
								onclick="javascript:submit();"></td>
						</tr>
					</table>
				</div>
				<!-- End Open Vacancies List -->
				<div class="col-md-4 col-sm-6">
	    				<div class="join-us-promo">
	    					<!-- Quote -->
							<div class="join-us-bubble">
								<blockquote>
									<p class="quote">
			                            "You are very welcome in our team! Ut enim ad minim veniam, quis nostrud exercitation."
	                        		</p>
	                        		<cite class="author-info">
	                        			- Name Surname,<br>Managing Director
	                        		</cite>
	                        	</blockquote>
	                        	<div class="sprite arrow-speech-bubble"></div>
	                        </div>
	                        <!-- Team Member Photo -->
	                        <div class="author-photo">
								<img src="img/user2.jpg" alt="Name Surname">
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
						<li><a href="page-tour.jsp">Tour List</a></li>
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