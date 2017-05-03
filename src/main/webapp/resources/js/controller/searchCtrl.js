

app.controller('searchCtrl', function ($scope,$http,$window) {

	$scope.text = "";
  $scope.movies = [];
  $scope.searchfor="";

	$scope.search = function() {
    $scope.searchfor = "Looking for movie containing '" + $scope.text + "'";

    $http({
			method  : 'POST',
			url     : '/searchmovie',
			data    : {
				name : $scope.text
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
		.success(function(data) {
			alert(data.data.message);
		})
		.error(function(data){
			alert(data.data.message);
		});
	};
});
