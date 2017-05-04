

app.controller('browseCtrl', function ($scope,$http,$window) {
	
	$scope.header = "Browse by Category";
	$scope.categoriesView = true;
	$scope.movies = [];
	$scope.searchMovies = [];
	$scope.allSearchMovieList = [];
	$scope.recommendedSearchMovieList = [];
	$scope.selected_type = "";
	$scope.searchResults = null;
	
	/*######################################################################################################*/
	/*###########################################  BY TYPE  ################################################*/
	/*######################################################################################################*/
	/* This is for searching for movies by type */
	
	$scope.type_changed = function() {
		$http({
			method  : 'POST',
			url     : '/movie_list_by_type',
			data    : { 
				movieType : $scope.selected_type
			}
		})
		.then(function(data) {
			$scope.movies = data.data.content;
		});
	};
	
	/*######################################################################################################*/
	/*########################################## SEARCHING ##################################################*/
	/*######################################################################################################*/

	/* This is for searching for movies by searching */
	$scope.searchMovies = function() {
		$scope.searchResults = "Search results for " + $scope.search;
		
		$http({
			method  : 'POST',
			url     : '/searchmovie',
			data    : { 
				name : $scope.search
			}
		})
		.then(function(data) {
			$scope.searchMovieList = data.data.content;
		});
	};
	
	/*######################################################################################################*/
	/*######################################### ALL MOVIES #################################################*/
	/*######################################################################################################*/
	
	/* This is for searching for movies by browing ALL movies */
	$scope.searchAllMovies = function() {
		$http({
			method  : 'GET',
			url     : '/allmovies'
		})
		.then(function(data) {
			$scope.allSearchMovieList = data.data;
		});
	};
	
	/*######################################################################################################*/
	/*########################################## RECOMMENDED ###############################################*/
	/*######################################################################################################*/
	
	$scope.searchRecommendedMovies = function() {
		
		$http({
			method  : 'POST',
			url     : '/recomendedlist',
			data    : { 
				email : $window.localStorage.getItem('username')
			}
		})
		.then(function(data) {
			$scope.recommendedSearchMovieList = data.data;
		});
	};
	
	
	/*######################################################################################################*/
	/*######################################################################################################*/
	/*######################################################################################################*/
	
	$scope.add_movie = function(movieId) {
		$http({
			method  : 'POST',
			url     : '/add_to_queue',
			data    : { 
				customerId: $window.localStorage.getItem('username'),
				movieId: movieId
			}
		})
		.then(function(data) {
			alert(data.data.message);
		});
		
	};
	
	$scope.changeCategoriesView = function() {
		$scope.categoriesView = true;
		$scope.searchView = false;
		$scope.recommendedView = false;
		$scope.allView = false;
		$scope.header = "Browse by Category";
	}
	
	$scope.changeSearchView = function() {
		$scope.categoriesView = false;
		$scope.searchView = true;
		$scope.recommendedView = false;
		$scope.allView = false;
		$scope.header = "Browse by Searching";
	}
	
	$scope.changeRecommendedView = function() {
		$scope.categoriesView = false;
		$scope.searchView = false;
		$scope.recommendedView = true;
		$scope.allView = false;
		$scope.header = "Recommended Movies";
		$scope.searchRecommendedMovies();
	}
	
	$scope.changeAllView = function() {
		$scope.categoriesView = false;
		$scope.searchView = false;
		$scope.recommendedView = false;
		$scope.allView = true;
		$scope.header = "Browse All Movies";
		$scope.searchAllMovies();
	}

});
