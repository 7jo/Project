<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%
	String pname = request.getAttribute("pname").toString();
	String pid = request.getAttribute("pid").toString();
	String imgSrc = request.getAttribute("pimg").toString();
	String id = (String) session.getAttribute("email");
	if (id == null)
		id = "";
%>

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

<style>
li {
	list-style: none;
}
</style>
<style type="text/css">
h {
	font-size: 45px;
}

<
script src ="js/modernizr-2.6.2-respond-1.1.0.min.js "> </script> <script src
	="//code.jquery.com /jquery-1.11.3.min.js "> </script> <script type
	="text/javascript">var date ;
	function submit () {
	/* alert($("#userid").text());
		alert($("#place").text());
		alert($("#comment").val()); */ var s = $("#comment").val();date =
	js_yyyy_mm_dd_hh_mm_ss();var email ="<%=id%>";if (email == '') {
	alert("로그인을 해야 입력이 가능합니다. 로그인 해주세요!!");
	
}

else
 
if
 
(
s
 
==
'')
{
alert
("글자를
 
입력해주세요
!!");

		
}
else {alert (date); $.ajax ({ type :"POST", url : "/Tour/update", data : 
	{
					"user" : email, "pid" : $("#pid").text (), "date" : date, "comment"
	: $("#comment").val ()
	
}

,
success
 
:
 
update

			
}
);
}
}
function js_yyyy_mm_dd_hh_mm_ss () {now = new Date();year = "" +
	now.getFullYear();month = "" + (now.getMonth() + 1);if (month.length ==
	1) { month = "0" + month;
	
}

day
 
=
""
+
now
.getDate
();

		
if
 
(
day
.length
 
==
1)
{
day
 
=
"0"
+
day
;

		
}
hour
 
=
""
+
now
.getHours
();

		
if
 
(
hour
.length
 
==
1)
{
hour
 
=
"0"
+
hour
;

		
}
minute
 
=
""
+
now
.getMinutes
();

		
if
 
(
minute
.length
 
==
1)
{
minute
 
=
"0"
+
minute
;

		
}
second
 
=
""
+
now
.getSeconds
();

		
if
 
(
second
.length
 
==
1)
{
second
 
=
"0"
+
second
;

		
}
return
 
year
+
"-"+
month
+
"-"+
day
+
"
"+
hour
+
"
:
"
+
minute
+
"
:
"
+
second
;

	
}
function update (data) {var result;var time = date.split(" ");var id =
	"<%=id%>";result = '<td>' + id+ '</td><td>' + $("#comment").val() +
	'</td><td>' + time[1] + '</td>'; $("#comment_table ").html(result);
	
}

</
script> <style>li {
	list-style: none;
}
</style>
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
		var email ="<%=id%>";
		if (email == '') {
			alert("로그인을 해야 입력이 가능합니다. 로그인 해주세요!!");
		} else if (s == '') {
			alert("글자를 입력해주세요!!");
		} else {
			$.ajax({
				type : "POST",
				url : "/Tour/update",
				data : {
					"user" : email,
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
		var result;
		var date = js_yyyy_mm_dd_hh_mm_ss();
		var id = "<%=id%>";
		result = '<td><strong><a>' + id+ '</a></strong></td><td>'
				+ $("#comment").val() + '</td><td>' + date + '</td>';
		$("#comment_table").html(result);
	}
</script>

<style>
li {
	list-style: none;
}

a {
	font-color: #000099;
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
										String url = "page-result.jsp";
										String result;
										if (emailId != null) {
									%>
									<a href="/Tour/page-logout.jsp?url=<%=url%>">로그아</a>
									<%
										} else {
									%>
									<a href="/Tour/page-login.jsp?islogin=true&url=<%=url%>">로그</a>
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
						<li><a href="page-team.jsp">프로젝트 맴버 </a></li>
						<li><a href="page-result.jsp">여행 추천 </a></li>
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
					<h1>Detail Information</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<h2 id="place"><%=pname%></h2>
			<p hidden id="pid"><%=pid%></p>
			<div class="row">
				<!-- Open Vacancies List -->
				<div class="team-member-image">
					<img alt="place"
						src="${pageContext.request.contextPath}/img/<%=imgSrc %>.png" />
				</div>
				<br>
			</div>
			<!-- /.panel -->
			<div class="chat-panel panel panel-default">

				<div class="panel-heading">
					&nbsp;&nbsp;&nbsp;<img src="img/comment.png"> &nbsp; Comment

					<div class="btn-group pull-right">

						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-chevron-down"></i>
						</button>


					</div>
				</div>



				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix"><span class="chat-img pull-left">

						</span>

							<div class="chat-body clearfix">
								<table width="100%">
									<col width="20%">
									<col width="50%">
									<col width="30%">
									<c:forEach items="${mlist}" var="reply">
										<tr>
											<td><strong><a>${reply.user}</a></strong></td>
											<td>${reply.comment}</td>
											<td>${reply.date}</td>
										</tr>
									</c:forEach>
									<tr id="comment_table"></tr>
								</table>
							</div></li>
					</ul>
					<br> <br>
				</div>
				<div class="panel-footer">
					<table>
						<tr>
							<td><strong class="primary-font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자
									:</strong></td>
							<td><strong class="primary-font" id="userid">&nbsp;<%=id%></strong></td>
						</tr>
					</table>
					<img src="img/user.png" align="left">
					<div class="input-group">
						<input id="comment" type="text" class="form-control input-sm"
							placeholder="후기를 입력하세요." /> <span class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat"
								onclick="javascript:submit();">등록</button>

						</span>
					</div>
				</div>
				<!-- End Open Vacancies List -->
				<div class="col-md-4 col-sm-6">
					<div class="join-us-promo"></div>
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


	<!— Javascripts —>
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