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
		<script src="/resources/js/controller/customerQueuesCtrl.js"></script>

	    <script type="text/javascript">employee_Lock();</script>

	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>

		<div class = "container" ng-controller ="customerQueuesCtrl">
			<div class="container">
				<select ng-model="selected_user" ng-options="x.customer.email for x in customers" ng-change="list_orders()">
				</select>
			</div>

			<div>
				<div class="jumbotron vertical-center" ng-hide="selected_user == null">
					<h3>{{selected_user.customer.email}}'s WISH LIST QUEUE (Account type: {{selected_user.acctType}})</h3>
					<div ng-repeat="y in wish_orders">
						<div class="well">
							<h2>Movie: {{y.name}}</h2>
							<h3>Number of copies: {{y.numCopies}}   fee: {{y.fee}}   Genre: {{y.movieType}}</h2>
							<button type="button" class="btn-primary btn-mid" ng-click="process_movie(y.id)" >
								Process Request
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
