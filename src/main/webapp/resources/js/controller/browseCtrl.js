

app.controller('browseCtrl', function ($scope,$http,$window) {
	
	$scope.header = "Browse by Category";
	$scope.categoriesView = true;
	$scope.movies = [];
	$scope.selected_type = "";


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
	}
	
	$scope.changeAllView = function() {
		$scope.categoriesView = false;
		$scope.searchView = false;
		$scope.recommendedView = false;
		$scope.allView = true;
		$scope.header = "Browse All Movies";
	}

});
