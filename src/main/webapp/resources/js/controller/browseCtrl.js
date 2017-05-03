

app.controller('browseCtrl', function ($scope,$http,$window) {

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

});
