

app.controller('employeeLoginCtrl', function ($scope,$http,$window) {

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
				if(data.status === "OK"){
					$window.localStorage.clear();
					$window.localStorage.setItem('username', $scope.employeeid);
					$window.localStorage.setItem(data.message, true);
					$window.location.href = '/employee';
				}else{
					$scope.message = "Incorrect ID or Password.";
				}
			});
	};

});
