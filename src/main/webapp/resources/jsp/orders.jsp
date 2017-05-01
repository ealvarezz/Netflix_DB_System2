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



    <script type="text/javascript">customer_Lock();</script>




	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>

		<div class = "container" ng-controller ="ordersCtrl">
			<h3>ORDERS FOR {{email}}</h3>
			<div class="jumbotron vertical-center">
				<h3>CURRENTLY HELD</h3>
				<div ng-repeat="x in cur_orders" >
					<div class="well c{{x.movieId}}">
						<h2>Movie: {{x.movie.name}}</h2>
						<h3>On: {{x.ree}}   fee: {{x.movie.fee}}   Genre: {{x.movie.movieType}}</h3>
						<button type="button" class="btn-primary btn-mid" ng-click="return_movie(x.movieId)" >
							Return Movie
						</button>
					</div>
				</div>
			</div>

			<div class="col-xs-12" style="height:50px;"></div>

			<div class="jumbotron vertical-center">
				<h3>WISH LIST</h3>
				<div ng-repeat="y in wish_orders">
					<div class="well">
						<h2>Movie: {{y.name}}</h2>
						<h3>Number of copies: {{y.numCopies}}   fee: {{y.fee}}   Genre: {{y.movieType}}</h2>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
