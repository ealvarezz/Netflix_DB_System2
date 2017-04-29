

var app = angular.module('FuegoVideo',[]);
app.controller('loginCtrl', function ($scope,$http,$window) {
	
	$scope.email = "";
	$scope.password = "";	
	$scope.message = "";

	$scope.login = function() {
		$http({
			method  : 'POST',
			url     : '/login_submit',
			data    : { 
				email : $scope.email,
				password : $scope.password
			}
		})
			.success(function(data) {
				$window.localStorage.setItem('username', $scope.email);
				$window.localStorage.setItem('customer', true);
				$window.location.href = '/';
			})
			.error(function(data){
				$scope.message = "Incorrect email or password.";
			});
	};

});
