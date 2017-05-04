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
		<script src="/resources/js/controller/browseCtrl.js"></script>

		<script type="text/javascript">customer_Lock();</script>
	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>

		<div class = "container" ng-controller ="browseCtrl">

			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>{{header}}</h2>

              <form id="selector viewSelection">
                <label class="radio-inline"><input type="radio" checked="checked"
                  name="optradio" id="categories" class ='viewSelection' ng-click="changeCategoriesView()">
                  Categories
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="search" class ='viewSelection' ng-click="changeSearchView()">
                  Search
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="recommended" class ='viewSelection' ng-click="changeRecommendedView()">
                  Recommended
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="all" class ='viewSelection' ng-click="changeAllView()">
                  All Movies
                </label>
              </form>

			<!-- ############################### THIS IS THE CATEGORIES VIEW  ############################### -->
				<div class = "viewSelection" ng-show="categoriesView">
					<div class="container">
						<select ng-model="selected_type" ng-change="type_changed()">
							<option value="Comedy">Comedy</option>
							<option value="Drama">Drama</option>
							<option value="Foreign">Foreign</option>
							<option value="Action">Action</option>
						</select>
					</div>
					<div>
						<div class="jumbotron vertical-center" ng-hide="selected_type == null">
							<h3>{{selected_type}} movies</h3>
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
				</div>


			<!-- ############################### THIS IS THE SEARCH VIEW  ############################### -->
				<div class = "viewSelection" ng-show="searchView">

					<!-- This is the search bar to loop for movies -->
					 <div class = "viewSelection">

				        <div class = "searchView" ng-show="searchView">
				          <form class="form-horizontal" method="POST">
				           <div class="form-group">
				             <label for="search">Search Movies</label>
				             <input type="text" ng-model="search" class="form-control" name="search" />
				           </div>
				           <div class="form-group">
				             <div class="text-right">
				               <button type="button" class ="btn-primary btn-mid" ng-click="searchMovies()" >
				                 Search
				               </button>
				             </div>
				           </div>
				           </form>
				         </div>

				</div>
				</div>
				<!-- This displays the movies the user has searched for -->
				<div ng-show="searchView">
					<div class="jumbotron vertical-center">
						<h3>{{searchResults}}</h3>
						<div ng-repeat="y in searchMovieList">
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


			<!-- ############################### THIS IS THE RECOMMENDED VIEW  ############################### -->
				<div class = "viewSelection" ng-show="recommendedView">
					<div>
						<div class="jumbotron vertical-center">
							<div ng-repeat="y in recommendedSearchMovieList">
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
				</div>



			<!-- ############################### THIS IS THE ALL VIEW  ############################### -->
				<div class = "viewSelection" ng-show="allView">
					<div>
						<div class="jumbotron vertical-center">
							<div ng-repeat="y in allSearchMovieList">
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
				</div>




			</div>
		</div>
	</div>
	</body>
</html>
