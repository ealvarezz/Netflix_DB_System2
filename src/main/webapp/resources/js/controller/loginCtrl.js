

var app = angular.module('FuegoVideo',[]);
app.controller('loginCtrl', function ($scope,$http,$window) {
	
	$scope.email = "";
	$scope.password = "";

	$scope.login = function() {
		$http({
			method  : 'POST',
			url     : '/login_submit',
			data    : { 
				username : $scope.email,
				password : $scope.password
			}
		})
			.success(function(data) {
				$window.localStorage.setItem('username', $scope.email);
				$window.localStorage.setItem('customer', true);
				// check status: ok or status:error
				alert(data);
			});
	};

});
