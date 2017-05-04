<%@ include file="/resources/jsp/include.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Fuego Video</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
		<script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/resources/js/app.js"></script>
		<script src="/resources/js/controller/manager/ActivityCtrl.js"></script>
		<script type="text/javascript">manager_Lock();</script>
	</head>
	<style>
.jumbotron
{
	margin: 10%;
	margin-top: 5%;
	padding-left: 20px;
	padding-right: 20px;
	
	/*color:white;
	  background-color:#E50914;*/
}

.viewSelection
{
  margin-top: 5%;
}

.removeStatView
{
	margin-top: 5%;
}

.backSearchBtn
{
	padding-bottom: 5%;
	border-bottom: 5px solid #000000;
}

.editEmployee
{
	margin-top: 5%;
	margin-bottom: 2%;
}

	</style>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
		
		<div class = "employee_options" ng-controller = "ActivityCtrl" >
			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>{{header}}</h2>
	
	             	<form id="selector viewSelection">
		                <label class="radio-inline"><input type="radio" checked="checked"
		                  name="optradio" id="actMovie" class ='viewSelection' ng-click="changeMovieView()">
		                  Most Active Movies
		                </label>
		                <label class="radio-inline"> <input type="radio" name="optradio"
		                  id="actCustomer" class ='viewSelection' ng-click="changeCustomerView()">
		                  Most Active Customers
		                </label>
		                <label class="radio-inline"> <input type="radio" name="optradio"
		                  id="actEmployee" class ='viewSelection' ng-click="changeEmployeeView()">
		                  Most Active Employee
		                </label>
	             	</form>
	             	
	             	<!-- ############################### THIS IS THE MOVIE VIEW  ############################### -->
	             	<div class = "viewSelection" ng-show="movieView">
	             	<!-- MOVIE VIEW BEGINS HERE -->
	            		<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="limit">Limit</label>
							<input type="number" class="form-control" ng-model="limit" name="limit"/>
						</div>
						<div class="text-right">
							<button type="button" class ="btn-primary btn-mid" ng-click="getActiveMovies()" >
								Get Movies
							</button>
						</div>
						</form>
	            		
						<div class="jumbotron vertical-center">
							<div ng-repeat="y in movies">
								<div class="well">
									<h2>Movie: {{y.name}}</h2>
								</div>
							</div>
						</div>
	
	             	<!-- MOVIE VIEW ENDS HERE -->
	             	</div>
	             	
	             	<!-- ############################### THIS IS THE CUSTOMER VIEW  ############################### -->
	             	<div class = "viewSelection" ng-show="customerView">
	             	<!-- CUSTOMER VIEW BEGINS HERE -->
	             		<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="climit">Limit</label>
							<input type="number" class="form-control" ng-model="climit" name="climit"/>
						</div>
						<div class="text-right">
							<button type="button" class ="btn-primary btn-mid" ng-click="getActiveCustomers()" >
								Get Customers
							</button>
						</div>
						</form>
	            		
						<div class="jumbotron vertical-center">
							<div ng-repeat="y in customers">
								<div class="well">
									<h2>Name: {{y.firstName}} {{y.lastName}}</h2>
									<h3>Email: {{y.email}}</h3>
								</div>
							</div>
						</div>
	             	<!-- CUSTOMER VIEW ENDS HERE -->
	             	</div>
	             	
	             	<!-- ############################### THIS IS THE EMPLOYEE VIEW  ############################### -->
	             	<div class = "viewSelection" ng-show="employeeView">
	             	<!-- EMPLOYEE VIEW BEGINS HERE -->
	             		<div class="jumbotron vertical-center">
							
								<div class="well">
									<h2>Name: {{employee.firstName}} {{employee.lastName}}</h2>
									<h3>EmployeeID: {{employee.ssn}}</h3>
								
							</div>
						</div>
	             	<!-- EMPLOYEE VIEW ENDS HERE -->
	             	</div>
	             	
				</div>
				 
			</div>
  	</div>
	</body>
</html>