

app.controller('bestsellerCtrl', function ($scope,$http,$window) {

	$scope.movies = [];


	$scope.bestsellers = function() {
		$http({
			method  : 'POST',
			url     : '/getbestseller',
			data    : {
				numCopies : 10
			}
		})
		.then(function(data) {
			$scope.movies = data.data.content;
		});
	};

  $scope.bestsellers();

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
