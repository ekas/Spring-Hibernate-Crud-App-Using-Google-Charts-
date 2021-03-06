    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Table Page</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' integrity='sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u' crossorigin='anonymous'>
	<style type='text/css'>
		.custom-container1{
			width: 100%;
			overflow-x: scroll; 
			-webkit-box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
			-moz-box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
			box-shadow: 4px 6px 13px -1px rgba(130, 126, 130, 0.64);
			padding: 50px;
		}
		.custom-container2{
			margin: 50px auto 0 auto;
			width: 600px;
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
	</style>	
</head>
<body>
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<!-- Brand and toggle get grouped for better mobile display -->
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        					<span class="sr-only">Toggle navigation</span>
        					<span class="icon-bar"></span>
        					<span class="icon-bar"></span>
        					<span class="icon-bar"></span>	
				</button>
      				<a class="navbar-brand" href="#">CHART MAKER</a>
    			</div>

    			<!-- Collect the nav links, forms, and other content for toggling -->	
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      					
      				<ul class="nav navbar-nav navbar-right">
        					
        					<li class="dropdown">
          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hello <c:if test="${pageContext.request.userPrincipal.name != null}">${pageContext.request.userPrincipal.name}</c:if> <span class="caret"></span></a>
          							<ul class="dropdown-menu">
            							<li>
            							<script>
											function formSubmit() {
												document.getElementById("logoutForm").submit();
											}
											</script>
											<c:url value="/j_spring_security_logout" var="logoutUrl" />
												<form action="${logoutUrl}" method="post" id="logoutForm">
													
												</form>							

												<c:if test="${pageContext.request.userPrincipal.name != null}">
													<a href="javascript:formSubmit()"> Logout</a>
												</c:if>
            						</li>
            					</ul>
        					</li>
      					</ul>
    			</div><!-- /.navbar-collapse -->
  		</div><!-- /.container-fluid -->
	</nav>



		<div class='container'>
        <div class='custom-container1'>
            <div class='custom-form'>
            	<form:form method="get" action="back">  
                    <h2>No of Employees</h2>       
                    
                    	<table id= "tab" class="table table-striped">
  							<tr>
  								<th>No Of Employees</th>
								<th>Department ID</th>
  							</tr>								
  								
  							<c:forEach var="emp" items="${list}"> 
  								<tr>
  									<td>${emp.noofemp}</td>
    								<td>${emp.deptid}</td>
  								</tr>
  						</c:forEach>
					</table>
					<input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Back'>
                </form:form>
            </div>
        </div>
    </div>
	<nav class="navbar navbar-default navbar-fixed-bottom ">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">&copy;chart maker 2016</a>
			</div>

			
		</div><!-- /.container-fluid -->
	</nav>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' integrity='sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa' crossorigin='anonymous'></script>	
</body>
</html>
	