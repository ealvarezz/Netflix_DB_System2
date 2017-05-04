



app.controller('editAcctCtrl', function ($scope,$http,$window) {

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
   $scope.plan = "";



	$scope.getInfo = function() {
	   $http({
		   method  : 'POST',
		   url     : '/accountsettings',
		   data    : {email : $window.localStorage.getItem('username')}
	   })
	   .then(function(data) {
		   var d = data.data.content;
		   var c = data.data.content.customer;
		   $scope.firstname = c.firstName;
		   $scope.lastname = c.lastName;
		   $scope.address = c.address;
		   $scope.city = c.city;
		   $scope.state = c.state;
		   $scope.zipcode = c.zip;
		   $scope.telephone = c.telephone;
		   $scope.email = c.email;
		   $scope.password = c.password;
		   $scope.creditcard = c.creditCard;
		   $scope.plan = d.acctType;
	   });
   };
	$scope.getInfo();


	$scope.update_acc = function() {
		var cancer =
		{
			acctType: $scope.plan,
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
			}
		};

	   $http({
		   method  : 'POST',
		   url     : '/update_account',
		   data    : cancer
	   })
		   .success(function(data) {
			   if(data.status === "OK"){
				   alert("Information updated.");
			   }else{
				   alert("Your form has errors.");
			   }
		   });
   };
   
   $scope.delete_acc = function() {
	
	   $http({
		   method  : 'POST',
		   url     : '/deleteaccount',
		   data    : {email : $window.localStorage.getItem('username')}
	   })
	   .then(function(data) {
		
		   alert(data.data.message);
		   $window.location.href = '/login';
			

		   $window.localStorage.clear();
	   });
   };
	

});
