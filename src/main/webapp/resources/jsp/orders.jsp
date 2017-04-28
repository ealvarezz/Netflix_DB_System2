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
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
		<script src="/resources/js/app.js"></script>
		<script src="/resources/js/controller/ordersCtrl.js"></script>
	</head>

	<body>
		<h3>ORDERS</h3>
		<div class = "container" ng-controller ="ordersCtrl">
			<div class="jumbotron vertical-center">
				<div ng-repeat="x in cur_orders">
					<div class="container" >
						<h1>{{x.}} </h1>
					</div>
				</div>

				<div ng-repeat="x in wish_orders">
					<div class="container" >
						<h1>{{x.}} </h1>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
