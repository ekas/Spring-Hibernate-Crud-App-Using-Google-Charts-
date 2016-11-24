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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

<style type="text/css">
h3 {
	display: inline-block;
	padding: 10px;
	background: #B9121B;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.full-screen {
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<div id="mycarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
			<c:forEach var="i" begin="1" end="${fn:length(list)-1}">
				<li data-target="#mycarousel" data-slide-to="${i}"></li>
			</c:forEach>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div id="mycarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
					<c:forEach var="i" begin="1" end="${fn:length(list)-1}">
						<li data-target="#mycarousel" data-slide-to="${i}"></li>
					</c:forEach>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item">
						<img
							src="http://www.nucleussoftware.com/public/gallery/who-we-are/Nucleus-building.JPG"
							data-color="lightblue" alt="Welcome Image">
						<div class="carousel-caption">
							<h3>Welcome</h3>
						</div>
					</div>
					<c:forEach var="list" items="${list}">
						<div class="item">
							<img src="data:image/jpg;base64,${list.convertBytesToString()}"
								data-color="lightblue" alt="${list.empname}">
							<div class="carousel-caption">
								<h3>${list.empid}</h3>
								<h3>${list.empname}</h3>
								<h3>${list.empdesig}</h3>
							</div>
						</div>
					</c:forEach>

				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#mycarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#mycarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#mycarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#mycarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js'></script>

	<script>
		var $item = $('.carousel .item');
		var $wHeight = $(window).height();
		$item.eq(0).addClass('active');
		$item.height($wHeight);
		$item.addClass('full-screen');

		$('.carousel img').each(function() {
			var $src = $(this).attr('src');
			var $color = $(this).attr('data-color');
			$(this).parent().css({
				'background-image' : 'url(' + $src + ')',
				'background-color' : $color
			});
			$(this).remove();
		});

		$(window).on('resize', function() {
			$wHeight = $(window).height();
			$item.height($wHeight);
		});

		$('.carousel').carousel({
			interval : 2000,
			pause : "false"
		});
	</script>

</body>
</html>