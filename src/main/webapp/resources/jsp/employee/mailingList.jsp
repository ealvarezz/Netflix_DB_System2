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
		<script src="/resources/js/controller/employee/customer_optionsCtrl.js"></script>
		<script type="text/javascript">employee_Lock();</script>
	</head>
	<style>
.jumbotron
{
	margin: 15%;
	margin-top: 5%;
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

.editMovie
{
	margin-top: 5%;
	margin-bottom: 2%;
}

	</style>

	<body ng-app="FuegoVideo">
	<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
	<div class = "movie_options" ng-controller = "customer_optionsCtrl" >
		<div class = "container">
			<div class="row">
				 <div class="col-lg-12 col-lg-offset-5">
					 <h2>Mailing List</h2>
				 </div>
			 </div>
					<div ng-repeat="y in mailingList">
						<div class="well">
							<h2>Address: {{y.address}}</h2>
						</div>
					</div>
  		</div>
</div>
</body>
</html>
