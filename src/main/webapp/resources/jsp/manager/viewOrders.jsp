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
		<script src="/resources/js/controller/manager/viewOrdersCtrl.js"></script>



    <script type="text/javascript">manager_Lock();</script>
		<style>
		.changeBtn
		{
			border: 1px solid black;
		}

		</style>




	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
		<div class = "container" ng-controller ="viewOrdersCtrl">





			<div class = "currentOrderView">
				<h3>ORDERS FOR {{email}}</h3>
				<div class="jumbotron vertical-center">
					<h3>{{optionHeader}}</h3>
					<div ng-repeat="x in orders" >
						<div class="well">
							<h2>Movie: {{x.movie.name}}</h2>
							<h3>Genre: {{x.movie.movieType}}</h3>
							<h3>Order On: {{x.ree}} </h3>

							<div ng-if="x.state == 'Held'">
							<button type="button" class="btn-primary btn-mid"
							  ng-click="return_movie(x.movieId)" >
								Return Movie
							</button>
						</div>

							<div ng-if="x.state == 'Returned'">
								<h3>Return Date: {{x.returnDate}}</h3>
							</div>

						</div>
						</div>
					</div>
				</div>



			<div class="col-xs-12" style="height:50px;"></div>
		</div>
	</body>
</html>
