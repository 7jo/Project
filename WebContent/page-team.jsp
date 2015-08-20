<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
											<a href="/Tour/page-logout.jsp">로그아웃</a>
									<%}else{ %>
									<a href="/Tour/page-login.jsp?islogin=true">로그인</a>
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
							<div class="team-member-image"><img src="img/team1.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<!-- Team Member Info & Social Links -->
									<li class="team-member-name">
										Name
										<!-- Team Member Social Links -->
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-github"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>차박사</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Team Member -->
					<div class="col-md-4 col-sm-6">
						<div class="team-member">
							<div class="team-member-image"><img src="img/team2.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<li class="team-member-name">
										Name
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-dribbble"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>연홍</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="team-member">
							<div class="team-member-image"><img src="img/team3.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<li class="team-member-name">
										Name
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-dribbble"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>병문</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="team-member">
							<div class="team-member-image"><img src="img/team4.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<li class="team-member-name">
										Name
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-dribbble"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>창훈</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="team-member">
							<div class="team-member-image"><img src="img/소윤.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<li class="team-member-name">
										Name
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-dribbble"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>소윤</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="team-member">
							<div class="team-member-image"><img src="img/team6.jpg" alt="Name Surname"></div>
							<div class="team-member-info">
								<ul>
									<li class="team-member-name">
										Name Surname
										<span class="team-member-social">
											<a href="#"><i class="icon-facebook"></i></a>
											<a href="#"><i class="icon-dribbble"></i></a>
											<a href="#"><i class="icon-tumblr"></i></a>
										</span>
									</li>
									<li>Systems Analyst</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="section">
	    	<div class="container">
	    		<h2>Join Us!</h2>
	    		<div class="row">
	    			<!-- Open Vacancies List -->
	    			<div class="col-md-8">
	    				<table class="jobs-list">
	    					<tr>
	    						<th>Position</th>
	    						<th>Location</th>
	    						<th>Type</th>
	    					</tr>
	    					<tr>
	    						<!-- Position -->
	    						<td class="job-position">
	    							<a href="page-job-details.html">Front End Developer</a> <span class="label label-danger">New</span>
	    						</td>
	    						<!-- Location -->
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">London</div>
	    						</td>
	    						<!-- Job Type -->
	    						<td class="job-type hidden-phone">FULL-TIME</td>
	    					</tr>
	    					<tr>
	    						<td class="job-position">
	    							<a href="page-job-details.html">Back-end Developer</a> <span class="label label-danger">New</span>
	    						</td>
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">Manchester</div>
	    						</td>
	    						<td class="job-type hidden-phone">PART-TIME</td>
	    					</tr>
	    					<tr>
	    						<td class="job-position">
	    							<a href="page-job-details.html">Creative Director</a>
	    						</td>
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">Manchester</div>
	    						</td>
	    						<td class="job-type hidden-phone">PART-TIME</td>
	    					</tr>
	    					<tr>
	    						<td class="job-position">
	    							<a href="page-job-details.html">Interactive Developer</a> <span class="label label-danger">New</span>
	    						</td>
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">Manchester</div>
	    						</td>
	    						<td class="job-type hidden-phone">PART-TIME</td>
	    					</tr>
	    					<tr>
	    						<td class="job-position">
	    							<a href="page-job-details.html">Lead Designer</a>
	    						</td>
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">Manchester</div>
	    						</td>
	    						<td class="job-type hidden-phone">PART-TIME</td>
	    					</tr>
	    					<tr>
	    						<td class="job-position">
	    							<a href="page-job-details.html">Ruby on Rails Developer</a>
	    						</td>
	    						<td class="job-location">
	    							<div class="job-country">United Kingdom</div>
	    							<div class="job-city">Manchester</div>
	    						</td>
	    						<td class="job-type hidden-phone">PART-TIME</td>
	    					</tr>
	    				</table>
	    			</div>
	    			<!-- End Open Vacancies List -->

	    			<!-- Sidebar -->
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
	    			<!-- End Sidebar -->
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