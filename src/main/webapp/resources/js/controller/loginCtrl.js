

var app = angular.module('FuegoVideo',[]);
app.controller('loginCtrl', function ($scope,$http) {

	$scope.username = "";
	$scope.password = "";

	$scope.login = function() {
		$http({
			method  : 'POST',
			url     : '/login',
			data    : { 
				username : $scope.email,
				password : $scope.password
			}
		})
			.success(function(data) {
				alert(data);
				alert(data.status);
			});
	};

});
