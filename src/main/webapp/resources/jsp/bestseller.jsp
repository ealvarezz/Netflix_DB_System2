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
		<script src="/resources/js/controller/bestsellerCtrl.js"></script>



    <script type="text/javascript">customer_Lock();</script>


	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>
		<div class = "container" ng-controller ="bestsellerCtrl">

			<div class="jumbotron vertical-center">
				<h3>Top Ten Best Selling Movies</h3>
				<div ng-repeat="y in movies">
					<div class="well">
						<div class="row">
							<div class="col-lg-6 col-lg-offset-3 text-center">
								<h2>{{y.name}}</h2>
							</div>
						</div>
						<h3>Genre: {{y.movieType}}</h3>
						<h3>Rating: {{y.rating}}</h3>
						<h3>Number of Copies: {{y.numCopies}}</h3>
						<button type="button" class="btn-primary btn-mid" ng-click="add_movie(y.id)" >
							Add to wish list
						</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
