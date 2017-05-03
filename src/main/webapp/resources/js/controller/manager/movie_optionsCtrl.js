app.controller('movie_optionsCtrl', function ($scope,$http,$window) {


  $scope.header = "Add New Movie";

  // For add new movie view
  $scope.Name = "";
  $scope.MovieType = "";
  $scope.Fee = "";
  $scope.numCopies = "";
  $scope.Rating = "";

  $scope.newMovieView = true;

  $scope.createMovie = function() {

		var cancer =
		{
				name : $scope.Name,
        movieType : $scope.MovieType,
				fee : $scope.Fee,
				numCopies : $scope.numCopies,
				rating : $scope.Rating
		};
    $http({
      method  : 'POST',
      url     : '/manager/addmovie',
      data    : cancer
    })
      .success(function(data) {
        if(data.status === "OK"){
          alert("Your new movie is added.");
          $scope.Name = "";
          $scope.MovieType = "";
          $scope.Fee = "";
          $scope.numCopies = "";
          $scope.Rating = "";
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
        alert('ERROR');
      });
  };

    /***************************************************************/

  // For edit movie view
  $scope.editMovies = [];
  $scope.movieToEdit = "";

  $scope.editsearchfor = "";
  $scope.editMovieView = false;
  $scope.searchView = true;
  $scope.editMovieViewForm = false;
  $scope.searchEdit = "";

  $scope.selectMovieEdit = function(movie) {
    $scope.searchView = false;
    $scope.editMovieViewForm = true;
    $scope.movieToEdit = movie;
  };

  $scope.editMovieInDb = function() {

    $http({
      method  : 'POST',
      url     : '/manager/editmovie',
      data    : $scope.movieToEdit
    })
      .success(function(data) {
        if(data.status === "OK"){
          alert("Movie data changed");
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
        alert('WENT DOWN');
        alert(data);
      });
  };

      /***************************************************************/

  // For remove movie view
  $scope.rmMovie = null;
  $scope.moviesToRemove = [];

  $scope.removeMovieView = false;
  $scope.searchRemove = "";
  $scope.searchViewRemove = true;
  $scope.removeStatView = false;

  $scope.setRmMovie = function(movie) {
    $scope.rmMovie = movie;
    $scope.searchViewRemove = false;
    $scope.removeStatView = true;
  };

  $scope.finalDeleteMovie = function() {

    $http({
			method  : 'POST',
			url     : '/manager/deletemovie',
			data    : {
				name : $scope.rmMovie.name
			}
		})
    .success(function(data) {
      if(data.status === "OK"){
        alert("Movie has been removed");
        $scope.backToSearch();
      }
    })
    .error(function(data){
      alert('WENT DOWN');
    });
  };

      /***************************************************************/

  //Buttons for searching and changing views
  $scope.backSearchBtn = true;

  $scope.search = function() {

    var searchM = "";
    if($scope.editMovieView) {
      searchM = $scope.searchEdit;
    }
    else if ($scope.removeMovieView) {
      searchM = $scope.searchRemove;
    }
    $http({
			method  : 'POST',
			url     : '/searchmovie',
			data    : {
				name : searchM
			}
		})
		.then(function(data) {

      if(data.data) {
        if($scope.editMovieView) {
          $scope.editMovies = data.data.content;
        }
        else if ($scope.removeMovieView) {
          $scope.moviesToRemove = data.data.content;
        }
      }
      else {
        alert("Movie was not found");
      }
		});
  };

  $scope.backToSearch = function() {
    if($scope.editMovieView) {
      $scope.searchView = true;
      $scope.editMovieViewForm = false;
      $scope.movieToEdit = null;
      $scope.search();
    }
    else if ($scope.removeMovieView) {
      $scope.searchViewRemove = true;
      $scope.removeStatView = false;
      $scope.rmMovie = null;
      $scope.search();
    }
  };


  $scope.changeNewMovieView = function() {
    $scope.newMovieView = true;
    $scope.editMovieView = false;
    $scope.removeMovieView = false;
    $scope.header = "Add New Movie";
  };


   $scope.changeEditMovieView = function() {
     $scope.newMovieView = false;
     $scope.editMovieView = true;
     $scope.removeMovieView = false;
     $scope.header = "Edit An Movie";
   };

   $scope.changeRemoveMovieView = function() {
     $scope.newMovieView = false;
     $scope.editMovieView = false;
     $scope.removeMovieView = true;
     $scope.header = "Remove An Movie";
   };

 });
