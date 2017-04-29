

var app = angular.module('FuegoVideo',[]);
app.controller('employeeLoginCtrl', function ($scope,$http,$window) {
	
	$scope.email = "";
	$scope.password = "";

	$scope.login = function() {
		$http({
			method  : 'POST',
			url     : '/employee_login_submit',
			data    : { 
				username : $scope.email,
				password : $scope.password
			}
		})
			.success(function(data) {
				$window.localStorage.setItem('username', $scope.email);
				$window.localStorage.setItem('employee', true);
				// check status: ok or status:error
			});
	};

});
