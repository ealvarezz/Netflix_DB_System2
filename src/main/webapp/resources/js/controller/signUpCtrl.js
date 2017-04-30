



app.controller('signUpCtrl', function ($scope,$http,$window) {

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


   $scope.plan = ""

	$scope.createCustomer = function() {
		var cancer = 	
		{ 
			acctnum: $scope.plan,
			customer: { 
				firstName : $scope.firstname,
				lastName : $scope.lastname,
				address : $scope.address,
				city : $scope.city,
				state : $scope.state,
				zip : $scope.zipcode,
				telephone : $scope.telephone,
				email : $scope.email,
				password : $scope.password,
				creditCard : $scope.creditcard,
				rating : 0
			}
		};

	   $http({
		   method  : 'POST',
		   url     : '/addcustomer',
		   data    : cancer
	   })
		   .success(function(data) {
			   alert(data);
			   alert(data.data);
		   })
		   .error(function(data){
			  	alert("reeeeeeeeeeeeeeee");
		   });
   };


});








