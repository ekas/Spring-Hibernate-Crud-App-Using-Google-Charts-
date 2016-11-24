<%@page import="org.springframework.security.crypto.codec.Base64"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bootstrap Carousel Full Screen</title>
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link href="css/full-slider.css" rel="stylesheet">
<style>
html,body {
	height: 100%;
}

.carousel,.item,.active {
	height: 100%;
}

.carousel-inner {
	height: 100%;
}

/* Background images are set within the HTML using inline CSS, not here */
.fill {
	width: 100%;
	height: 100%;
	background-position: center;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

footer {
	margin: 50px 0;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Start Bootstrap</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Full Page Image Background Carousel Header -->
	<header id="myCarousel" class="carousel slide"> <!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
		<c:forEach var="i" begin="1" end="${fn:length(list)-1}">
			<li data-target="#mycarousel" data-slide-to="${i}"></li>
		</c:forEach>
	</ol>

	<!-- Wrapper for Slides -->
	<div class="carousel-inner">
		<div class="item active">
			<!-- Set the first background image using inline CSS below. -->
			<div class="fill"
				style="background-image: url('http://www.nucleussoftware.com/public/gallery/who-we-are/Nucleus-building.JPG');"></div>
			<div class="carousel-caption">
				<h2>Welcome</h2>
			</div>
		</div>
		<c:forEach var="list" items="${list}">
			<div class="item">
				<!-- Set the first background image using inline CSS below. -->
				<div class="fill"
					style="background-image:url(data:image/jpg;base64,${list.convertBytesToString()});"></div>
				<div class="carousel-caption">
					<h3>${list.empid}</h3>
					<h3>${list.empname}</h3>
					<h3>${list.empdesig}</h3>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- Controls --> <a class="left carousel-control" href="#myCarousel"
		data-slide="prev"> <span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a> </header>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<h1>Full Slider by Start Bootstrap</h1>
				<p>
					The background images for the slider are set directly in the HTML
					using inline CSS. The rest of the styles for this template are
					contained within the
					<code>full-slider.css</code>
					file.
				</p>
			</div>
		</div>

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
		<!-- /.row --> </footer>

	</div>
	<!-- /.container -->

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js'></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 2000
		//changes the speed
		})
	</script>

</body>

</html>