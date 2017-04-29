'use strict';

var app = angular.module('FuegoVideo', []);






app.controller('navCtrl', function ($scope,$http,$window) {
	$scope.logout = function(){
		$window.localStorage.clear();
		$window.location.href = '/login';
	};

});





