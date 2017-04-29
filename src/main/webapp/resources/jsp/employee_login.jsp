<%@ include file="include.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Fuego Video</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
		<script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
		<script src="/resources/js/app.js"></script>
		<script src="/resources/js/controller/employeeLoginCtrl.js"></script>
	</head>
	<style>
.jumbotron
{
	margin: 25%;
	margin-top: 5%;
	/*color:white;
	  background-color:#E50914;*/
}
	</style>

	<body ng-app = "FuegoVideo">

		<div class = "login">
			<div class = "container" ng-controller = "employeeLoginCtrl">
				<div class="jumbotron vertical-center">
					<h2>EMPLOYEE LOG IN</h2>
					<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" ng-model="email" class="form-control" name="email" />{{email}}
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" ng-model="password" class="form-control" name="password" />{{password}}
						</div>
						<div class="text-right">
							<button type="button" class ="btn-primary btn-mid" ng-click="login()" >
								Log in
							</button>
					</form>
						</div>
				</div>
			</div>
	</body>
</html>
