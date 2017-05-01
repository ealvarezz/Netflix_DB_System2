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
		<script src="/resources/js/controller/searchCtrl.js"></script>
	</head>
  <style>
  .searchbar
  {
  margin-top: 10px;
  }

  </style>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>
		<div class = "container" ng-controller ="searchCtrl">



			<div class="container">
        <div class ="row">
           <div class="col-md-6 col-md-offset-3">
             <form class="form-horizontal" method="POST">
   						<div class="form-group">
   							<label for="text">Search For Movie</label>
   							<input type="text" ng-model="text" class="form-control searchbar" name="text" />
   						</div>
              <div class="form-group">
                <div class="text-right">
    							<button type="button" class ="btn-primary btn-mid" ng-click="search()" >
    								Search
    							</button>
                </div>
              </div>
            </form>
           </div>
        </div>
			</div>
			<div>
        <div class="jumbotron vertical-center">
					<h3 ng-model="searchfor">{{searchfor}}</h3>
					<div ng-repeat="y in movies">
						<div class="well">
							<h2>Movie: {{y.name}}</h2>
							<h3>Number of copies: {{y.numCopies}}   fee: {{y.fee}}   Genre: {{y.movieType}}</h2>
							<button type="button" class="btn-primary btn-mid" ng-click="add_movie(y.id)" >
								Add to wish list
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
