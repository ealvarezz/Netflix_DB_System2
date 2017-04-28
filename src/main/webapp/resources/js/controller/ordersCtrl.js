


var app = angular.module('FuegoVideo',[]);
app.controller('ordersCtrl', function ($scope,$http) {

	$scope.username = "";//GET EMAIL FROM COOKIE

	$scope.cur_orders = [];
	$scope.wish_orders = [];

	$scope.list_orders = function() {
		$http({
			method  : 'POST',
			url     : '/orders',
			data    : { 
				username : $scope.email
			}
		})
		.success(function(data) {
			$scope.cur_orders = data.data.cur_orders;
			$scope.wish_orders = data.data.wish_orders;
		});
	};
	
	$scope.list_orders();

});
