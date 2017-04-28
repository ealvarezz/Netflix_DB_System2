



var app = angular.module('FuegoVideo',[]);
app.controller('signUpCtrl', function ($scope,$http) {

   $scope.FirstName = "";
   $scope.LastName = "";
   $scope.Address = "";
   $scope.City = "";
   $scope.State = "";
   $scope.ZipCode = "";
   $scope.Telephone = "";
   $scope.Email = "";
   $scope.Password = "";
   $scope.CCN = "";

   $scope.createCustomer = function() {
	   $http({
		   method  : 'POST',
		   url     : '/signup',
		   data    : { 
			   firstname = $scope.FirstName,
			   lastname = $scope.LastName,
			   address = $scope.Address,
			   city = $scope.City,
			   state = $scope.State,
			   zipcode = $scope.ZipCode,
			   telephone = $scope.Telephone,
			   email = $scope.Email,
			   password = $scope.Password,
			   creditcard = $scope.CCN
		   }
	   })
		   .success(function(data) {
			   alert(data);
			   alert(data.status);
		   });
   };


});








