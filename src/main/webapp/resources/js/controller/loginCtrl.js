

var app = angular.module('FuegoVideo',[]);
app.controller('loginCtrl', function ($scope,$http) {

   $scope.words = "";
   $scope.username = "";
   $scope.password = "";

   $scope.login = function() {
     $scope.words = $scope.username + " " + $scope.password;
   };
});
