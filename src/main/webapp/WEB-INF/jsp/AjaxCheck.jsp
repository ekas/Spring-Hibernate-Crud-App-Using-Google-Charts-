
<%@page import="org.springframework.security.crypto.codec.Base64"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart Page</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'
	integrity='sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u'
	crossorigin='anonymous'>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type='text/css'>
.custom-container {
	margin: 50px auto 0 auto;
	width: 900px;
	-webkit-box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
	-moz-box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
	box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
	padding: 50px;
}

.custom-button {
	margin-right: 10px;
	color: white;
	background-color: #66afe9;
	padding: 8px 20px 8px 20px;
	border-radius: 2px;
	border: 1px solid #66afe9;
}

.custom-button:hover {
	color: #66afe9;
	background-color: #ffffff;
	border: 1px solid #66afe9;
}

#table-cust,.alert-box {
	display: none;
}

#ItemPreview {
	height: 100px;
	width: 100px;
}
</style>


</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">CHART MAKER</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Hello <c:if
							test="${pageContext.request.userPrincipal.name != null}">${pageContext.request.userPrincipal.name}</c:if>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><script>
							function formSubmit() {
								document.getElementById("logoutForm").submit();
							}
						</script> <c:url value="/j_spring_security_logout" var="logoutUrl" />
							<form action="${logoutUrl}" method="post" id="logoutForm">

							</form> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a href="javascript:formSubmit()"> Logout</a>
							</c:if></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class='container'>
		<div class='custom-container'>
			<div class='custom-form'>
				<c:if test="${not empty msg}">
					<div class="alert-box alert alert-success" style="display: block;"
						role="alert">${msg}</div>
				</c:if>
					<h2>Search Ajax</h2>
					<form:form method="get" action="">
    					Enter Name: <input id="searchbox">
					</form:form>
			</div>
		</div>
	</div>


	
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#searchbox")
			.autocomplete(
				{
					source : function(request, response) {
						$.getJSON(
							"${pageContext.request.contextPath}/getMatchedNames",
							{
								term : request.term
							},response);
							}
		});
	});
</script>
</script		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'
		integrity='sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa'
		crossorigin='anonymous'></script>
</html>
