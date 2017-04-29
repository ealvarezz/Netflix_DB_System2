



app.controller('signUpCtrl', function ($scope,$http) {

   $scope.firstname = "";
   $scope.lastname = "";
   $scope.address = "";
   $scope.city = "";
   $scope.state = "";
   $scope.zipcode = "";
   $scope.telephone = "";
   $scope.email = "";
   $scope.password = "";
   $scope.creditcard = "";

   $scope.createCustomer = function() {
	   alert("CALLED FUNC");

		var cancer = 	{ 
			firstname : $scope.firstname,
			lastname : $scope.lastname,
			address : $scope.address,
			city : $scope.city,
			state : $scope.state,
			zipcode : $scope.zipcode,
			telephone : $scope.telephone,
			email : $scope.email,
			password : $scope.password,
			creditcard : $scope.creditcard
		   };

		alert(cancer);

	   $http({
		   method  : 'POST',
		   url     : '/signup_submit',
		   data    : cancer
	   })
		   .success(function(data) {
			   alert(data);
			   alert(data.status);
		   });
   };


});








