


app.controller('ordersCtrl', function ($scope,$http,$window) {

	$scope.email = $window.localStorage.getItem('username');

	$scope.cur_orders = [];
	$scope.wish_orders = [];

	$scope.list_orders = function() {
		$http({
			method  : 'POST',
			url     : '/getcustomerorders',
			data    : {
				email : $scope.email
			}
		})
		.then(function(data) {
			var k = 0;
			var re = null;
			for(k; k < data.data.length; k++){
				re = new Date(data.data[k].timeDate);
				data.data[k].ree = re.toLocaleString();
			}
			$scope.cur_orders = data.data;
		});
		$http({
			method  : 'POST',
			url     : '/getwishlist',
			data    : {
				email : $scope.email
			}
		})
		.then(function(data) {
			$scope.wish_orders = data.data;
		});
	};

	$scope.list_orders();

	$scope.return_movie = function(movieId) {

		$http({
			method  : 'POST',
			url     : '/returnmovie',
			data    : {
				movieId: movieId,
				customerId : $scope.email
			}
		})
		.then(function(data) {
			var k = 0;

			for(k = 0; k < $scope.cur_orders.length; k++ ){
				if(movieId === $scope.cur_orders[k].movieId){
					$scope.cur_orders.splice(k,1);
				}
			}
			alert("Movie returned.");
		});
	};

});
