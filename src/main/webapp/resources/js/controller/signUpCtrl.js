



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

		var date;
		date = new Date();
		date = date.getUTCFullYear() + '-' +
			('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
			('00' + date.getUTCDate()).slice(-2);

		var cancer = 	
		{ 
			acctType: $scope.plan,
			accountDate: date,

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
			   if(data.status === "OK"){
				   alert("You now have an account.");
				   $window.location.href = '/login';
			   }else{
				   alert("Your form has errors.");
			   }
		   })
		   .error(function(data){
		   });
   };


});








