


var app = angular.module('FuegoVideo',[]);
app.controller('ordersCtrl', function ($scope,$http,$window) {

	$scope.email = $window.localStorage.getItem('username');

	$scope.cur_orders = [];
	$scope.wish_orders = [];

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
	
	$scope.list_orders();

});
