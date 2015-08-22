<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script src="/Tour/js/jquery-map.js"></script>
<script type="text/javascript">
	var map;
	var real_center;
	var lineSymbol;
	var line;
	var danwon6;
	var result;

	function initMap() {
		real_center = {
			lat : 37.3478859333,
			lng : 126.8879395
		};
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 10,
			center : real_center
		});

		danwon6 = new google.maps.LatLng(37.318576, 126.829089);

		// Create the polyline and add the symbol via the 'icons' property.
		line = new google.maps.Polyline({
			path : [ danwon6 ],
			map : map
		});
		loadMarker();

	}
	function animateArrow(line) {
		var count = 0;
		window.setInterval(function() {
			count = (count + 1) % 200;

			var icons = line.get('icons');
			icons[0].offset = (count / 2) + '%';
			line.set('icons', icons);
		}, 20);
	}
	function loadMarker() {
		$.ajax({
			type : "GET",
			url : "/Tour/result",
			success : getScript
		});
	}
	function getScript(data) {
		var result;
		result = data;
		$("#code").html(result);
	}

	function clickInMap(position_name) {
		//클릭시 이벤트
		$.ajax({
			type : "GET",
			url : "/Tour/list",
			data : {
				"title" : position_name
			},
			success : listOk
		});
	}
	function listOk(data) {
		result = data.split(":");
		var place = result[0];
		var path = result[1];
		
		var splitPath = path.split("->");
		drawLine(splitPath);
		var recPath = '<a href="${pageContext.request.contextPath}/detail?place='+place+'" class="list-group-item"> <i class="fa fa-comment fa-fw"></i>&nbsp;&nbsp;&nbsp;<img src="img/bt.png">&nbsp;'+path+' <span class="pull-right text-muted small"><em>detail>></em></span></a>';
		$("#recmdlist").html(recPath);
	}
	function drawLine(result) {
		line.setMap(null);
		newMap(result);
	};
	function newMap(result) {
		var size = result.length;
		lineSymbol = {
			path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
			strokeColor : '#FF0000'
		};

		line = new google.maps.Polyline({
			strokeColor : "#A2A5A8",
			icons : [ {
				icon : lineSymbol,
				offset : '100%'
			} ],
			map : map
		});
		var path = line.getPath();
		for (var i = 0; i < size; i++) {
			path.push(hashmap.get(result[i]));
		}
		line.setPath(path);

		animateArrow(line);

	}
</script>
<script id="code"></script>
<style>
li {
	list-style: none;
}
</style>
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.container-full {
	margin: 0 auto;
	width: 100%;
}

#map {
	width: 100% !important;
	height: 100%;
}

.panel {
	width: 100%;
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
						<li class="logo-wrapper"><a href="index.jsp"> <img
								src="img/s1.png"><img src="img/t2.png">
						</a></li>
						<ul>
							<li><h4>
									<%
										String emailId = (String) session.getAttribute("email");
										String url = "page-result.jsp";
										String result;
										if (emailId != null) {
									%>
									<a href="/Tour/page-logout.jsp?url=<%=url%>">Logout</a>
									<%
										} else {
									%>
									<a href="/Tour/page-login.jsp?islogin=true&url=<%=url%>">Login</a>
									<%
										}
									%>
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
			<h2>List of The Place!!</h2>
			<div class="row">
				<!-- Open Vacancies List  col-xs-8-->
				<li>
					<div class="col-md-8">

						<div id="map" class="ui-resizable"
							style="position: relative; overflow: hidden; transform: translateZ(0px) translateZ(0px); height: 466px; background-color: rgb(229, 227, 223);">
							<div class="ui-resizable-handle ui-resizable-s"
								style="z-index: 90;"></div>
							<div class="gm-style"
								style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;">
								<div
									style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;">
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);">
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;">
											<div
												style="position: absolute; left: 0px; top: 0px; z-index: 0;"></div>
										</div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"></div>
									</div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);">
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div>
									</div>
								</div>
							</div>
							<div class="gm-style"
								style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;">
								<div
									style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;">
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, -1440, -6133);">
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;">
											<div
												style="position: absolute; left: 0px; top: 0px; z-index: 0;">
												<div aria-hidden="true"
													style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;">
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 5911px;"></div>
												</div>
											</div>
										</div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;">
											<div
												style="position: absolute; left: 0px; top: 0px; z-index: -1;">
												<div aria-hidden="true"
													style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;">
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2052px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1796px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1796px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2052px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1540px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1540px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2308px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2308px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1284px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1284px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2564px; top: 6167px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2564px; top: 6423px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2052px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1796px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2308px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1540px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 2564px; top: 5911px;"></div>
													<div
														style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 1284px; top: 5911px;"></div>
												</div>
											</div>
										</div>
										<div
											style="position: absolute; left: 0px; top: 0px; z-index: 0;">
											<div aria-hidden="true"
												style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;">
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7003!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7002!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7001!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7004!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7000!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 6167px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7005!3i3163!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7002!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7003!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7004!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7001!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7000!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 6423px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7005!3i3164!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2052px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7003!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1796px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7002!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2308px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7004!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1540px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7001!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 2564px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7005!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
												<div
													style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 1284px; top: 5911px; transition: opacity 200ms ease-out;">
													<img
														src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i13!2i7000!3i3162!2m3!1e0!2sm!3i317000000!3m9!2sko!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0"
														draggable="false"
														style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
											</div>
										</div>
									</div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div>
									<div
										style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, -1440, -6133);">
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div>
										<div
											style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;">
											<div
												style="cursor: default; position: absolute; width: 53px; height: 18px; left: 1013px; top: -234px; z-index: -234; visibility: hidden;">
												<div style="position: absolute; left: 0px; top: 0px;">
													<div
														style="width: 0px; height: 0px; border-right-width: 10px; border-right-style: solid; border-right-color: transparent; border-left-width: 10px; border-left-style: solid; border-left-color: transparent; border-top-width: 24px; border-top-style: solid; border-top-color: rgba(0, 0, 0, 0.0980392); position: absolute; left: 17px; top: 18px;"></div>
													<div
														style="position: absolute; left: 0px; top: 0px; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; width: 53px; height: 18px; background-color: rgba(0, 0, 0, 0.2);"></div>
													<div
														style="border-top-width: 24px; position: absolute; left: 17px; top: 15px;">
														<div
															style="position: absolute; overflow: hidden; left: -6px; top: -1px; width: 16px; height: 30px;">
															<div
																style="position: absolute; left: 6px; transform: skewX(22.6deg); transform-origin: 0px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div>
														</div>
														<div
															style="position: absolute; overflow: hidden; top: -1px; left: 10px; width: 16px; height: 30px;">
															<div
																style="position: absolute; left: 0px; transform: skewX(-22.6deg); transform-origin: 10px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div>
														</div>
													</div>
													<div
														style="position: absolute; left: 1px; top: 1px; border-radius: 2px; width: 51px; height: 16px; background-color: rgb(255, 255, 255);"></div>
												</div>
												<div class="gm-style-iw"
													style="top: 9px; position: absolute; left: 15px; width: 23px; overflow: hidden;">
													<div
														style="display: inline-block; overflow: auto; max-height: 297px; max-width: 654px;"></div>
												</div>
												<div
													style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 10px; z-index: 10000; cursor: pointer;">
													<img
														src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
														draggable="false"
														style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div
									style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;">
									<a target="_blank"
										href="https://maps.google.com/maps?ll=37.865155,127.759645&amp;z=13&amp;t=m&amp;hl=ko&amp;gl=US&amp;mapclient=apiv3"
										title="Google 지도에서 이 지역을 보려면 클릭하세요."
										style="position: static; overflow: visible; float: none; display: inline;"><div
											style="width: 62px; height: 26px; cursor: pointer;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/google_white2.png"
												draggable="false"
												style="position: absolute; left: 0px; top: 0px; width: 62px; height: 26px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div></a>
								</div>
								<div
									style="padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 525px; top: 143px; background-color: white;">
									<div style="padding: 0px 0px 10px; font-size: 16px;">지도
										데이터</div>
									<div style="font-size: 13px;">지도 데이터 ©2015 SK planet</div>
									<div
										style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;">
										<img
											src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
											draggable="false"
											style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
									</div>
								</div>
								<div class="gmnoprint"
									style="z-index: 1000001; position: absolute; right: 50px; bottom: 0px; width: 144px;">
									<div draggable="false" class="gm-style-cc"
										style="-webkit-user-select: none;">
										<div
											style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
											<div style="width: 1px;"></div>
											<div
												style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div>
										</div>
										<div
											style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;">
											<a
												style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer; display: none;">지도
												데이터</a><span>지도 데이터 ©2015 SK planet</span>
										</div>
									</div>
								</div>
								<div class="gmnoscreen"
									style="position: absolute; right: 0px; bottom: 0px;">
									<div
										style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">지도
										데이터 ©2015 SK planet</div>
								</div>
								<div class="gmnoprint gm-style-cc" draggable="false"
									style="z-index: 1000001; -webkit-user-select: none; position: absolute; right: 0px; bottom: 0px;">
									<div
										style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
										<div style="width: 1px;"></div>
										<div
											style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div>
									</div>
									<div
										style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;">
										<a
											href="https://www.google.com/intl/ko_US/help/terms_maps.html"
											target="_blank"
											style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">이용약관</a>
									</div>
								</div>
								<div draggable="false" class="gm-style-cc"
									style="-webkit-user-select: none; display: none; position: absolute; right: 0px; bottom: 0px;">
									<div
										style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
										<div style="width: 1px;"></div>
										<div
											style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div>
									</div>
									<div
										style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;">
										<a target="_new" title="Google에 도로 지도 또는 이미지 오류 신고"
											href="https://www.google.com/maps/@37.8651546,127.7596447,13z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3"
											style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">지도
											오류 신고</a>
									</div>
								</div>
								<div class="gmnoprint" draggable="false" controlwidth="78"
									controlheight="356"
									style="margin: 5px; -webkit-user-select: none; position: absolute; left: 0px; top: 0px;">
									<div class="gmnoprint" controlwidth="78" controlheight="80"
										style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;">
										<div class="gmnoprint" controlwidth="78" controlheight="80"
											style="width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;">
											<div style="visibility: hidden;">
												<svg version="1.1" overflow="hidden" width="78px"
													height="78px" viewBox="0 0 78 78"
													style="position: absolute; left: 0px; top: 0px;">
												<circle cx="39" cy="39" r="35" stroke-width="3"
														fill-opacity="0.2" fill="#f2f4f6" stroke="#f2f4f6"></circle>
												<g transform="rotate(0 39 39)">
												<rect x="33" y="0" rx="4" ry="4" width="12" height="11"
														stroke="#a6a6a6" stroke-width="1" fill="#f2f4f6"></rect>
												<polyline points="36.5,8.5 36.5,2.5 41.5,8.5 41.5,2.5"
														stroke-linejoin="bevel" stroke-width="1.5" fill="#f2f4f6"
														stroke="#000"></polyline></g></svg>
											</div>
										</div>
										<div class="gmnoprint" controlwidth="59" controlheight="59"
											style="position: absolute; left: 10px; top: 11px;">
											<div
												style="width: 59px; height: 59px; overflow: hidden; position: relative;">
												<img
													src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
													draggable="false"
													style="position: absolute; left: 0px; top: 0px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
												<div title="좌측으로 이동"
													style="position: absolute; left: 0px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div>
												<div title="우측으로 이동"
													style="position: absolute; left: 39px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div>
												<div title="위로 이동"
													style="position: absolute; left: 20px; top: 0px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div>
												<div title="아래로 이동"
													style="position: absolute; left: 20px; top: 39px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div>
											</div>
										</div>
									</div>
									<div controlwidth="32" controlheight="40"
										style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; position: absolute; left: 23px; top: 85px;">
										<div aria-label="스트리트 뷰 페그맨 컨트롤"
											style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png"
												draggable="false"
												style="position: absolute; left: -9px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div aria-label="페그맨 사용 안함"
											style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png"
												draggable="false"
												style="position: absolute; left: -107px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div aria-label="지도 위에 페그맨이 있음"
											style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png"
												draggable="false"
												style="position: absolute; left: -58px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div aria-label="스트리트 뷰 페그맨 컨트롤"
											style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png"
												draggable="false"
												style="position: absolute; left: -205px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
									</div>
									<div class="gmnoprint" controlwidth="0" controlheight="0"
										style="opacity: 0.6; display: none; position: absolute;">
										<div title="지도 90도 회전"
											style="width: 22px; height: 22px; overflow: hidden; position: absolute; cursor: pointer;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
												draggable="false"
												style="position: absolute; left: -38px; top: -360px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
									</div>
									<div class="gmnoprint" controlwidth="25" controlheight="226"
										style="position: absolute; left: 27px; top: 130px;">
										<div title="확대"
											style="width: 23px; height: 24px; overflow: hidden; position: relative; cursor: pointer; z-index: 1;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
												draggable="false"
												style="position: absolute; left: -17px; top: -400px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div title="클릭하여 확대/축소"
											style="width: 25px; height: 178px; overflow: hidden; position: relative; cursor: pointer; top: -4px;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
												draggable="false"
												style="position: absolute; left: -17px; top: -87px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div title="끌어서 확대/축소"
											style="width: 21px; height: 14px; overflow: hidden; position: absolute; transition: top 0.25s ease; z-index: 2; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; left: 2px; top: 84px;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
												draggable="false"
												style="position: absolute; left: 0px; top: -384px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
										<div title="축소"
											style="width: 23px; height: 23px; overflow: hidden; position: relative; cursor: pointer; top: -4px; z-index: 3;">
											<img
												src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
												draggable="false"
												style="position: absolute; left: -17px; top: -361px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;">
										</div>
									</div>
								</div>
								<div class="gmnoprint"
									style="margin: 5px; z-index: 0; position: absolute; cursor: pointer; right: 0px; top: 0px;">
									<div class="gm-style-mtc" style="float: left;">
										<div draggable="false" title="거리 지도 보기"
											style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; border: 1px solid rgba(0, 0, 0, 0.14902); box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 24px; font-weight: 500; background-color: rgb(255, 255, 255); background-clip: padding-box;">지도</div>
										<div
											style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; left: 0px; top: 19px; text-align: left; display: none; background-color: white; background-clip: padding-box;">
											<div draggable="false" title="지형과 거리 지도 보기"
												style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);">
												<span role="checkbox"
													style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div
														style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;">
														<img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png"
															draggable="false"
															style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;">
													</div></span><label style="vertical-align: middle; cursor: pointer;">지형</label>
											</div>
										</div>
									</div>
									<div class="gm-style-mtc" style="float: left;">
										<div draggable="false" title="위성 이미지 보기"
											style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; border-width: 1px 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-color: rgba(0, 0, 0, 0.14902); border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 23px; background-color: rgb(255, 255, 255); background-clip: padding-box;">위성</div>
										<div
											style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; right: 0px; top: 19px; text-align: left; display: none; background-color: white; background-clip: padding-box;">
											<div draggable="false" title="45도 보기를 표시하려면 확대하세요."
												style="color: rgb(184, 184, 184); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; display: none; background-color: rgb(255, 255, 255);">
												<span role="checkbox"
													style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(241, 241, 241); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div
														style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;">
														<img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png"
															draggable="false"
															style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;">
													</div></span><label style="vertical-align: middle; cursor: pointer;">45°</label>
											</div>
											<div draggable="false" title="거리 이름과 이미지 함께 보기"
												style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);">
												<span role="checkbox"
													style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div
														style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;">
														<img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png"
															draggable="false"
															style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;">
													</div></span><label style="vertical-align: middle; cursor: pointer;">라벨</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<script
							src="https://maps.googleapis.com/maps/api/js?signed_in=false&callback=initMap"></script>
				</li>
				<li class="divider"></li>

				<!-- 		<table class="jobs-list">
						<tr>
							<th>Location</th>
							<th>Link</th>
						</tr>
						<tr>
							
							<td class="job-position">관광지 A <span
								class="label label-danger">New</span>
							</td>
						
							<td class="job-location">
								<div class="job-country">
									<a href="${pageContext.request.contextPath}/detail?place=a">Detail>></a>
								</div>
							</td>
						</tr>
						-->


				<li>
					<div class="col-md-4">
						<td>
							<div class="panel panel-default">

								<div class="panel-heading">
									<img src="img/list.png"> &nbsp; Location
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
								<!-- 리스트 추가되는 곳  -->
									<div id="recmdlist" class="list-group"></div>
								</div>
							</div>
					</div>
			</div>
		</div>
	</div>


	</li>







	<!-- End Open Vacancies List -->


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



























