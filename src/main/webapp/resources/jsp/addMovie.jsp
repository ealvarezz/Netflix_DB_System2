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
		<script src="/resources/js/controller/addMovieCtrl.js"></script>


		<script type="text/javascript">manager_Lock();</script>

	</head>
	<style>
  .jumbotron
  {
  	margin: 25%;
  	margin-top: 5%;
  	/*color:white;
  	  background-color:#E50914;*/
  }

  .copiesBtn
  {
    display:none;
  }
	</style>

	<body ng-app = "FuegoVideo">

		<div class = "container" ng-controller = "addMovieCtrl">
			<div class="jumbotron vertical-center">
				<h2>{{header}}</h2>

        <div class="row">
          <div class="col-lg-10 col-lg-offset-3">
            <form id="selector">
              <label class="radio-inline"><input type="radio" checked="checked"
                name="optradio" id="changeNewMovie" ng-click="newMovie()">
                New Movie
              </label>

              <label class="radio-inline"> <input type="radio" name="optradio"
                id="changeMoreCopies" ng-click="moreCopies()">
                Add Copies
              </label>
							<label class="radio-inline"> <input type="radio" name="optradio"
								id="addCopies" class ='viewSelection' ng-click="changeCopiesMovieView()">
								Add More Copies To Movie
							</label>
            </form>
          </div>
        </div>

				<form class="form-horizontal" method="POST">
					<div class="form-group">
						<label for="movieName">Name of Movie</label>
						<input type="text" ng-model="movieName" class="form-control" name="movieName" / required>
            {{movieName}}
					</div>
					<div class="form-group newMovieDiv">
						<label for="movieType">Genre</label>
						<input type="text" ng-model="movieType" class="form-control" name="movieType" / required>
            {{movieType}}
					</div>
          <div class="form-group newMovieDiv">
            <label for="fee">Distribution Fee</label>
						<input type="text" ng-model="fee" class="form-control" name="fee" / required>
            {{fee}}
          </div>
          <div class="form-group">
            <label for="numcopies">Number Of Copies</label>
						<input type="text" ng-model="numcopies" class="form-control" name="numcopies" / required>
            {{numcopies}}
          </div>
          <div class="form-group newMovieDiv">
            <label for="rating">Rating</label>
						<input type="text" ng-model="rating" class="form-control" name="rating" required/>
            {{rating}}
          </div>

					<div class="form-group text-right newMovieDiv">
						<button type="button" class ="btn-primary btn-mid" ng-click="submitMovie()"
            ng-disabled="form.$invalid">
							Add New Movie
						</button>
          </div>

          <div class="form-group text-right copiesBtn">
						<button type="button" class ="btn-primary btn-mid" ng-click="submitCopy()" >
              Add More Copies
						</button>
          </div>
				</form>
			</div>
		</div>

      <script>
      $('#changeNewMovie').on('click', function (e) {
        $('.newMovieDiv').show()
        $('.copiesBtn').hide()
      })

      $('#changeMoreCopies').on('click', function (e) {
        $('.newMovieDiv').hide()
        $('.copiesBtn').show()
      })
      </script>
	</body>
</html>
