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
		<script src="/resources/js/controller/manager/movie_optionsCtrl.js"></script>
		<script type="text/javascript">manager_Lock();</script>
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
		<div class = "movie_options" ng-controller = "movie_optionsCtrl" >
			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>{{header}}</h2>

              <form id="selector viewSelection">
                <label class="radio-inline"><input type="radio" checked="checked"
                  name="optradio" id="newMovie" class ='viewSelection' ng-click="changeNewMovieView()">
                  Add New Movie
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="editMovie" class ='viewSelection' ng-click="changeEditMovieView()">
                  Edit a Movie
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="removeMovie" class ='viewSelection' ng-click="changeRemoveMovieView()">
                  Remove a Movie
                </label>
								<label class="radio-inline"> <input type="radio" name="optradio"
                  id="allMovies" class ='viewSelection' ng-click="changeAllMovieView()">
                  View All Movies
                </label>
              </form>

          <div class = "viewSelection" ng-show="newMovieView">
					<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="name">Movie Name</label>
							<input type="text" class="form-control" ng-model="Name"
              name="name" required />
						</div>

						<div class="form-group">
							<label for="MovieType">Genre</label>
							<input type="text" class="form-control" ng-model="MovieType" name="MovieType" required />
						</div>

						<div class="form-group">
							<label for="Fee">Distribution Fee</label>
							<input type="text" class="form-control" ng-model="Fee" name="Fee" required />
						</div>

            <div class="form-group">
							<label for="numCopies">Number of Copies</label>
							<input type="text" class="form-control" ng-model="numCopies" name="numCopies" required />
						</div>

						<div class="form-group">
							<label for="Rating">Rating</label>
							<input type="text" class="form-control" ng-model="Rating" name="Rating" required />
						</div>
						<button class ="btn-primary btn-mid" id="submit" ng-click="createMovie()" >
							Submit
						</button>
					</form>
				</div> <!--End of newMovieView div -->

        <!------------------------------------------------------------------>


        <div class = "viewSelection" ng-show="editMovieView">
          <div class = "searchView" ng-show="searchView">
            <div class="container">
              <div class ="row">
                 <div class="col-md-6 col-md-offset-3">
                   <form class="form-horizontal" method="POST">
         						<div class="form-group">
         							<label for="text">Search For Movie Keyword</label>
         							<input type="text" ng-model="searchEdit" class="form-control searchbar" name="searchEdit" />
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
            <h3 ng-model="searchfor">{{editsearchfor}}</h3>
            <div ng-repeat="y in editMovies">
              <div class="well">
                <h1>{{y.name}}</h1>
                <h3>Number of copies: {{y.numCopies}}    Fee: \${{y.fee}}   Genre: {{y.movieType}}</h2>
                <button type="button" class="btn-primary btn-mid" ng-click="selectMovieEdit(y)" >
                  Edit Movie
                </button>
              </div>
            </div>
          </div>
        </div>


					<div class = "viewSelection" ng-show="editMovieViewForm">

					<div class="row backSearchBtn" ng-show="backSearchBtn">
						 <div class="col-lg-8 col-lg-offset-3">
							<button type="button" class ="btn-primary btn-mid" ng-click="backToSearch()" >
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								Search Another Movie
							</button>
						</div>
					</div>
          <div class ="row">
             <div class="col-md-6 col-md-offset-3">
               <h2>{{movieToEdit.name}}</h2>
             </div>
           </div>
					<form class="form-horizontal editMovie" method="POST">
            <div class="form-group">
							<label for="MovieType">Genre</label>
							<input type="text" class="form-control" ng-model="movieToEdit.movieType" name="MovieType" required />
						</div>

						<div class="form-group">
							<label for="Fee">Distribution Fee</label>
							<input type="text" class="form-control" ng-model="movieToEdit.fee" name="Fee" required />
						</div>

            <div class="form-group">
							<label for="numCopies">Number of Copies</label>
							<input type="text" class="form-control" ng-model="movieToEdit.numCopies" name="numCopies" required />
						</div>

						<button class ="btn-primary btn-mid" id="submit" ng-click="editMovieInDb()" >
							Submit
						</button>
					</form>
				</div> <!--End of editMovieView div -->


				<div class = "viewSelection" ng-show="removeMovieView">
        <div class = "searchView" ng-show="searchViewRemove">

          <div class="container">
            <div class ="row">
               <div class="col-md-6 col-md-offset-3">
                 <form class="form-horizontal" method="POST">
                  <div class="form-group">
                    <label for="text">Search For Movie Keyword</label>
                    <input type="text" ng-model="searchRemove" class="form-control searchbar" name="text" />
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
          <div ng-repeat="y in moviesToRemove">
            <div class="well">
              <h1>{{y.name}}</h1>
              <h3>Number of copies: {{y.numCopies}}   Fee: {{y.fee}}   Genre: {{y.movieType}}</h2>
              <button type="button" class="btn-primary btn-mid" ng-click="setRmMovie(y)" >
                Edit Movie
              </button>
            </div>
          </div>

          </div>

					<div class = "removeStatView" ng-show="removeStatView">
						<div class="row backSearchBtn" ng-show="backSearchBtn">
							 <div class="col-lg-8 col-lg-offset-3">
								<button type="button" class ="btn-primary btn-mid" ng-click="backToSearch()" >
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									Search Another Movie
								</button>
							</div>
						</div>
						<div id="delMovieStats">
							<h2>Movie: {{rmMovie.name}}</h2>
							<h3>Genre: {{rmMovie.movieType}}
							<h3>Distribution Fee: \${{rmMovie.fee}}</h3>
							<h3>Number Of Copies: {{rmMovie.numCopies}}</h3>
						</div>
						<button type="button" class="btn-danger btn-mid" ng-click="finalDeleteMovie()" >
							Delete Movie
						</button>
					</div>
			</div> <!-- End for removeMovieView -->

					<!------------------------------------------------------->

			<div class = "viewSelection" ng-show="allMovieView">
				<div ng-repeat="y in movieList">
					<div class="well">
						<h2>Movie: {{y.name}}</h2>
						<h3>Genre: {{y.movieType}}</h3>
						<h3>Number of copies: {{y.numCopies}}
						<h3>Distribution Fee: {{y.fee}}
						<h3>Rating: {{y.rating}}
					</div>
				</div>
		</div> <!-- End for allMovieView -->
  </div>
</div>
</body>
</html>
