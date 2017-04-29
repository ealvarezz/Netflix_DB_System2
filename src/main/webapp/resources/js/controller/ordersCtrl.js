


app.controller('ordersCtrl', function ($scope,$http,$window) {

	$scope.email = $window.localStorage.getItem('username');

	$scope.cur_orders = ["hi","bye","reee"];
	$scope.wish_orders = ["gimme","dat","monay"];

	$scope.list_orders = function() {
		$http({
			method  : 'POST',
			url     : '/orders_submit',
			data    : { 
				email : $scope.email
			}
		})
		.success(function(data) {
			$scope.cur_orders = data.data.cur_orders;
			$scope.wish_orders = data.data.wish_orders;
		});
	};
	
	$scope.return_movie = function(movieid) {
		/*$http({
			method  : 'POST',
			url     : '/orders_submit',
			data    : { 
				email : $scope.email
			}
		})
		.success(function(data) {
			$scope.cur_orders = data.data.cur_orders;
			$scope.wish_orders = data.data.wish_orders;
		});*/
		alert(movieid);
	};

	$scope.list_orders();

});
