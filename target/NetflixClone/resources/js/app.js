'use strict';

var app = angular.module('FuegoVideo', []);
app.config(function ($routeProvider) {
     $routeProvider
       .when('/', {
         templateUrl:'/resources/jsp/login.jsp',
         controller: 'loginCtrl'
       }).when('/allcustomerList', {
         templateUrl:'/resources/jsp/CustomerList.jsp',
         controller: 'CustomerMailListCtrl'
       }).otherwise({
         redirectTo: '/'
       });
});
