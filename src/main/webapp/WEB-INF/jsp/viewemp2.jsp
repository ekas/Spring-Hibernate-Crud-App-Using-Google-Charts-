    <%@page import="org.springframework.security.crypto.codec.Base64"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Chart Page</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' integrity='sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u' crossorigin='anonymous'>
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
        #ItemPreview{
        	height: 100px;
        	width: 100px;
        }
    </style>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
 <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' integrity='sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa' crossorigin='anonymous'></script>    
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
    
      var data = google.visualization.arrayToDataTable([
            ['Department ID', 'Number of Employees per Department']
            <c:forEach var="emplist" items="${emplist}">
              ,['${emplist.deptid}',${emplist.noofemp}]
            </c:forEach>
          ]);       
        
        var options = {
          title: 'Number Of Employees',
          chartArea: {width: '50%'},
          hAxis: {
            title: 'Number of Employees',
            minValue: 0
          },
          vAxis: {
            title: 'Department ID'
          }
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data, options);
// Add our selection handler.
google.visualization.events.addListener(chart, 'select', selectHandler);

// The selection handler.
// Loop through all items in the selection and concatenate
// a single message from all of them.
function selectHandler() {
  var selection = chart.getSelection();
  var message = '';
  for (var i = 0; i < selection.length; i++) {
    var item = selection[i];
    if (item.row != null && item.column != null) {
      //var str = data.getFormattedValue(item.row, item.column);
      //message += 'Department ID:' + item.row + '\n' + 'Number of Employees' + str  + '\n';
      
      window.location =  item.row+1;
      //$('#table-cust').css('display','block');
    } 
  }
  /*if (message == '') {
    message = 'nothing';
  }
  alert('You selected ' + message);*/
}
      }
  		
  $(function(){
	  $("#search1").click(function(){
		  var searchname = $('#searchfield').val();
		  console.log(searchname);
		    if (searchname.length === 0) {
		      alert("Search Field Can't be blank");
		      return false;
		    }
	  });
	  
	  $("#search2").click(function(){
		  var orderby = $('#orderby').val();
		  var ordertype = $('#ordertype').val();
		  console.log(orderby);
		  console.log(ordertype);
		  if (orderby == "-1" && orderby == "-1") {
		     alert("Both Selections are Important");
		  return false;
		  }
	  });
	  
  });
 
  
  
  </script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')">
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
            <div class='custom-container'>
                <div class='custom-form'> 
                	<c:if test="${not empty msg}">
                		<div class="alert-box alert alert-success" style="display: block;"role="alert">${msg}</div>
					</c:if>          
                    <form:form method="get" action="back">  
                    <h2>No of Employees</h2>
                    <div id="chart_div"></div>
                    <input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Back'>
                </form:form>
            </div>
        </div>
    </div>      
    
 <c:if  test="${!empty empDeptClick}">
 <sec:authorize access="hasRole('ROLE_ADMIN')">
	<div class='container'>
            <div class='custom-container'>
                <div class='custom-form'>           
               
                    <h2>Crud Operations</h2>
                    <div class="row">
                    	<a href="http://localhost:8080/02DataChartHibernate/add"><input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Add'></a>
                    </div>   
            </div>
        </div>
    </div>
   </sec:authorize>
    <div class='container' id='table-cust' style="display: block;">
        <div class='custom-container'>
            <div class='custom-form'>
              <form:form method="get" action="search">  
                    <h2>Employees Specific to Department</h2> 
                    <div class="search-div form-group">
                    	<input type="text" class="form-control" placeholder="search by name" name="searchfield" id="searchfield">
                    	<br> 
                    	<input class='custom-button btn btn-default' id='search1' type='submit' name='btn' value='Search1'>
                    
                    </div>
                    <div class="sort-div form-group">
                    	<select id="orderby" class="form-control custom-combobox" name="orderby">
            				<option value="-1">Select Order By Field</option>
            				<option value="empid">Employee ID</option>
            				<option value="empname">Employee Name</option>
          				</select>
          				<br> 
          				<select id="ordertype" class="form-control custom-combobox" name="ordertype">
            				<option value="-1">Select Order By Type</option>
            				<option value="ASC">AESC</option>
            				<option value="DESC">DESC</option>            				
          				</select> 
          				<br> 
          				<input class='custom-button btn btn-default' id='search2' type='submit' name='btn' value='Search2'>
          				<br>                    
                    </div>
                    </form:form>
                    <br>
				<form:form method="get" action="update">  
				
                      <table id= "tab" class="table table-striped">
                <tr>
                	<th>Select to Update</th>
                  	<th>Employee ID</th>
                	<th>Employee Name</th>
                	<th>Employee Designation</th>
                	<th>Employee Image</th><!--  
                	<sec:authorize access="hasRole('ROLE_ADMIN')">
                		<th>Operations</th>
                	</sec:authorize>-->
                </tr>               
                <c:forEach var="empDeptClick" items="${empDeptClick}"> 
                  <tr>
                  	<td>
                  	<div class="radio">
  						<label>
    						<input type="radio" name="optionsRadios" id="optionsRadios1" value=${empDeptClick.empid}>  						
						</div>
                  	</td>
                    <td>${empDeptClick.empid}</td>
                    <td>${empDeptClick.empname}</td>
                    <td>${empDeptClick.empdesig}</td>
                   	<!-- <td><img id="ItemPreview" src="data:image/jpg;base64,${empDeptClick.empimgstr}"/>-->
                    </td><!-- 
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    	<td>                     	
                    		<a href="http://localhost:8080/02DataChartHibernate/delete/${empDeptClick.empid}"><input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Delete'></a>
                    		<a href="http://localhost:8080/02DataChartHibernate/update/${empDeptClick.empid}"><input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Update'></a>                   
                    	</td>
                    </sec:authorize> -->
                  </tr>
                  
              </c:forEach>
              <input class='custom-button btn btn-default' id='button' type='submit' name='btn' value='Update'>
              </form:form>
          </table>
          
                
            </div>
        </div>
    </div>
</c:if>
</sec:authorize>

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
    
</html>
  