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
		<style>
		.changeBtn
		{
			border: 1px solid black;
		}

		.rateForm
		{
			margin-top: 2%;
		}

		</style>




	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>
		<div class = "container" ng-controller ="ordersCtrl">
		<div class="row">
		  <div class="col-lg-6 col-lg-offset-3 text-center">
				<div class="btn-group" role="group" aria-label="Basic example">
					<button type="button" class="btn btn-secondary changeBtn"
					 ng-disabled="pastBtn" ng-click="past_orders()">
						<h3>Past Orders</h3>
				 	</button>
					 <button type="button" class="btn btn-secondary changeBtn"
					 ng-disabled="currentBtn"  ng-click="current_orders()">
						 <h3>Current Orders</h3>
					</button>
				 <button type="button" class="btn btn-secondary changeBtn"
				 ng-disabled="allBtn" ng-click="all_orders()">
					 <h3>All Orders</h3>
				</button>
			</div>
			</div>
		</div>




			<div class = "currentOrderView">
				<h3>ORDERS FOR {{email}}</h3>
				<div class="jumbotron vertical-center">
					<h3>{{optionHeader}}</h3>
					<div ng-repeat="x in orders" >
						<div class="well">
							<h2>Movie: {{x.movie.name}}</h2>
							<h3>Genre: {{x.movie.movieType}}</h3>
							<h3>Rating: {{x.movie.rating}}</h3>
							<h3>Ordered On: {{x.ree}} </h3>

							<div ng-if="x.state == 'Held'">
							<button type="button" class="btn-primary btn-mid"
							  ng-click="return_movie(x.movieId)" >
								Return Movie
							</button>
						</div>

							<div ng-if="x.state == 'Returned'">
								<h3>Returned On: {{x.returnDate}}</h3>
								<form class="form-inline rateForm">
									<input type="number" placeholder="Give Movie A Rating"
									class="form-control searchbar" data-ng-model="rating"/>
									<button type="button" class="btn-primary btn-mid"
									  ng-click="rateMovie(x.movieId,rating)" >
										Rate Movie
									</button>
								</form>
							</div>

						</div>
						</div>
					</div>
				</div>



			<div class="col-xs-12" style="height:50px;"></div>
		</div>
	</body>
</html>
