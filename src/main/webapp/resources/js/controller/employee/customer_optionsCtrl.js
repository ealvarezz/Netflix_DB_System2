app.controller('customer_optionsCtrl', function ($scope,$http,$window) {


  $scope.header = "Add New Customer";

  // For add new customer view
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

  $scope.newCustomerView = true;

  $scope.createCustomer = function() {

    var date;
		date = new Date();
		$scope.startDate = date.getUTCFullYear() + '-' +
			('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
			('00' + date.getUTCDate()).slice(-2);

      alert($scope.plan);
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
          alert("Your New Customer Is Added.");
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
        alert('ERROR');
      });
  };

    /***************************************************************/

  // For edit customer view
  $scope.editCustomer = null;
  $scope.editPlan = null;

  $scope.editCustomerView = false;
  $scope.searchView = true;
  $scope.editCustomerViewForm = false;
  $scope.searchEdit = "";

  $scope.setEditCustomer = function(customer) {
    $scope.searchView = false;
    $scope.editCustomerViewForm = true;
    $scope.editCustomer = customer;
  };

  $scope.editCustomerInDb = function() {

    var cancer =
		{
			acctType: $scope.editPlan,
			customer: {
				firstName : $scope.editCustomer.firstName,
				lastName : $scope.editCustomer.lastName,
				address : $scope.editCustomer.address,
				city : $scope.editCustomercity,
				state : $scope.editCustomer.state,
				zip : $scope.editCustomer.zip,
				telephone : $scope.editCustomer.telephone,
				email : $scope.editCustomer.email,
				password : $scope.editCustomer.password,
				creditCard : $scope.editCustomer.creditCard,
        rating : $scope.editCustomer.rating
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

      /***************************************************************/

  // For remove customer view
  $scope.rmCustomer = null;

  $scope.rmLastName = null;

  $scope.removeCustomerView = false;
  $scope.searchRemove = "";
  $scope.searchViewRemove = true;
  $scope.removeStatView = false;

  $scope.setRmCustomer = function(customer) {
    $scope.rmCustomer = customer;
    $scope.searchViewRemove = false;
    $scope.removeStatView = true;
  };

  $scope.finalDeleteCustomer = function() {

    $http({
			method  : 'POST',
			url     : '/manager/deletecustomer',
			data    : {
				ssn : $scope.rmCustomer.ssn
			}
		})
    .success(function(data) {
      if(data.status === "OK"){
        alert("Customer has been removed");
        $scope.backToSearch();
      }
    })
    .error(function(data){
      alert('WENT DOWN');
      alert(data);
    });
  };

      /***************************************************************/

  //Buttons for searching and changing views
  $scope.backSearchBtn = true;

  $scope.searchBtn = function() {

    var searchEmail = "";
    if($scope.editCustomerView) {
      searchEmail = $scope.searchEdit;
    }
    else if ($scope.removeCustomerView) {
      searchEmail = $scope.searchRemove;
    }
    $http({
			method  : 'POST',
			url     : '/accountsettings',
			data    : {
				email : searchEmail
			}
		})
		.then(function(data) {

      if(data.data) {
        if($scope.editCustomerView) {
          $scope.setEditCustomer(data.data);
        }
        else if ($scope.removeCustomerView) {
          $scope.setRmCustomer(data.data);
        }
      }
      else {
        alert("Customer was not found");
      }
		});
  };

  $scope.backToSearch = function() {
    if($scope.editCustomerView) {
      $scope.searchView = true;
      $scope.editCustomerViewForm = false;
      $scope.editCustomer = null;
    }
    else if ($scope.removeCustomerView) {
      $scope.searchViewRemove = true;
      $scope.removeStatView = false;
      rmCustomer = null;
    }
  };


  $scope.changeNewCustomerView = function() {
    $scope.newCustomerView = true;
    $scope.editCustomerView = false;
    $scope.removeCustomerView = false;
    $scope.header = "Add New Customer";
  };



   $scope.changeEditCustomerView = function() {
     $scope.newCustomerView = false;
     $scope.editCustomerView = true;
     $scope.removeCustomerView = false;
     $scope.header = "Edit An Customer";
   };

   $scope.changeRemoveCustomerView = function() {
     $scope.newCustomerView = false;
     $scope.editCustomerView = false;
     $scope.removeCustomerView = true;
     $scope.header = "Remove An Customer";
   };

 });
