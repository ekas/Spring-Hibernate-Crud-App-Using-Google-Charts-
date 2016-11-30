<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">	
	<title>Login Page</title>
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style type="text/css">
		.custom-container{
			margin: 50px auto 0 auto;
			width: 600px;
			-webkit-box-shadow: 4px 6px 13px -1px rgba(130,126,130,0.64);
			-moz-box-shadow: 4px 6px 13px -1px rgba(130,126,130,0.64);
			box-shadow: 4px 6px 13px -1px rgba(130,126,130,0.64);
			padding: 50px;
		}
		.custom-button{	
			color: white;	
			background-color: #66afe9;			
			padding : 8px 10px 8px 10px;
			border-radius: 2px;
			border: 1px  solid #66afe9;
		}
		.custom-button:hover{	
			color: #66afe9;		
			background-color: #ffffff;
			border: 1px  solid #66afe9;
		}
	</style>
</head>
<body>
<body onload='document.loginForm.username.focus();'>	
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
      				<a class="navbar-brand" href="#">Brand</a>
    			</div>

    			<!-- Collect the nav links, forms, and other content for toggling -->	
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      					
      				<ul class="nav navbar-nav navbar-right">
        					
        					<li class="dropdown">
          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">New User? <span class="caret"></span></a>
          				<ul class="dropdown-menu">
            					<li><a href="form.html">User Form</a></li></ul>
        					</li>
      					</ul>
    			</div><!-- /.navbar-collapse -->
  		</div><!-- /.container-fluid -->
	</nav>
	<div class="container">
		<div class="custom-container">
			<div class="custom-form">
				<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
					<h2>Sign In</h2>
					
					<c:if test="${not empty error}">
						<div class="alert alert-danger" >${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="alert alert-info">${msg}</div>
					</c:if>
					
  					<div class="form-group">
    						<label for="exampleInputEmail1">Username</label>
    						<input type="text" class="form-control" id="email" placeholder="Username" name="username" required>
  					</div>
  					<div class="form-group">
    						<label for="exampleInputPassword1">Password</label>
    						<input type="password" class="form-control" id="pass" placeholder="Password" name="password" required>
  					</div>
  					<input class="custom-button btn btn-default" type="submit" name="submit" value="submit">
  						
				</form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script>
</script>
<script>
		$(function(){
   		$("button").click(function(){
        		var x = document.getElementById("email").value;
				var y = document.getElementById("pass").value;
    			if (x.length === 0 || y.length === 0) {
        			alert("All Fields are mandatory");
        			return false;
    			}
    		});
   		});
</script>
</body>
</html>