

var app = angular.module('FuegoVideo',[]);
app.controller('employeeLoginCtrl', function ($scope,$http,$window) {
	
	$scope.employeeid = "";
	$scope.password = "";	
	$scope.message = "";

	$scope.login = function() {
		$http({
			method  : 'POST',
			url     : '/employee_login_submit',
			data    : { 
				ssn : $scope.employeeid,
				password : $scope.password
			}
		})
			.success(function(data) {
				$window.localStorage.setItem('username', $scope.employeeid);
				$window.localStorage.setItem('employee', true);
				$window.localStorage.setItem('manager', true);
				$window.location.href = '/employee';
			})
			.error(function(data){
				$scope.message = "Incorrect id or password.";
			});
	};

});
