'use strict';

var app = angular.module('FuegoVideo', []);

var customer_Lock = function(){
	if(localStorage.getItem("customer") === "true"){
		return true;
	}
	alert("Please login as a customer.")
	window.location.href = '/login';
};

var manager_Lock = function(){
	if(localStorage.getItem("manager") === "true"){
		return true;
	}
	alert("Must be a manager to view this page.")
	window.location.href = '/employee_login';
};

var employee_Lock = function(){
	if(localStorage.getItem("employee") === "true" || localStorage.getItem("manager") === "true"){
		return true;
	}
	alert("Must be an employee to view this page.")
	window.location.href = '/employee_login';
};

app.controller('navCtrl', function ($scope,$http,$window) {
	$scope.logout = function(){

		if(localStorage.getItem("employee") === "true" || localStorage.getItem("manager") === "true"){
			$window.location.href = '/employee_login';
		}
		else {
			$window.location.href = '/login';
		}

		$window.localStorage.clear();

	};

	$scope.managerNavCtrl = function() {
 	if (localStorage.getItem("manager") === "true") {
 		$scope.managerViewNav = true;
 	}
 	else {
 	  $scope.managerViewNav = false;
 	}
 };
$scope.managerNavCtrl();
});
