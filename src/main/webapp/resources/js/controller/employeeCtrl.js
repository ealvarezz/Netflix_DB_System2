


var app = angular.module('FuegoVideo',[]);
app.controller('indexCtrl', function ($scope,$http,$window) {
	$scope.username = $window.localStorage.getItem('username');

	if($window.localStorage.getItem('employee') == null){
		$scope.position = "Employee";
	}
});
