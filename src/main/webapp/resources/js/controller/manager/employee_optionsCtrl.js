app.controller('employee_optionsCtrl', function ($scope,$http,$window) {


  $scope.header = "Add New Employee";

  // For add new employee view
  $scope.firstname = "";
  $scope.lastname = "";
  $scope.address = "";
  $scope.city = "";
  $scope.state = "";
  $scope.zipcode = "";
  $scope.telephone = "";
  $scope.ssn = "";
  $scope.password = "";
  $scope.hourlyRate = "";
  $scope.startDate = "";

  $scope.newEmployeeView = true;

  $scope.createEmployee = function() {

    var date;
		date = new Date();
		$scope.startDate = date.getUTCFullYear() + '-' +
			('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
			('00' + date.getUTCDate()).slice(-2);
      alert($scope.lastname);
		var cancer =
		{
				firstName : $scope.firstname,
				lastName : $scope.lastname,
				address : $scope.address,
				city : $scope.city,
				state : $scope.state,
				zip : $scope.zipcode,
				telephone : $scope.telephone,
				ssn : $scope.ssn,
        password : $scope.password,
				startDate : $scope.startDate,
				hourlyRate : $scope.hourlyRate,
		};
    $http({
      method  : 'POST',
      url     : '/manager/addemployee',
      data    : cancer
    })
      .success(function(data) {
        if(data.status === "OK"){
          alert("Your new employee is added.");
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
        alert('ERROR');
      });
  };

    /***************************************************************/

  // For edit employee view
  $scope.editEmployee = null;

  $scope.editEmployeeView = false;
  $scope.searchView = true;
  $scope.editEmployeeViewForm = false;
  $scope.searchEdit = "";

  $scope.setEditEmployee = function(employee) {
    $scope.searchView = false;
    $scope.editEmployeeViewForm = true;
    $scope.editEmployee = employee;
  };

  $scope.editEmployeeInDb = function() {

    $http({
      method  : 'POST',
      url     : '/manager/editemployee',
      data    : $scope.editEmployee
    })
      .success(function(data) {
        if(data.status === "OK"){
          alert("Employee data changed");
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
        alert('WENT DOWN');
        alert(data);
      });
  };

      /***************************************************************/

  // For remove employee view
  $scope.rmEmployee = null;

  $scope.rmLastName = null;

  $scope.removeEmployeeView = false;
  $scope.searchRemove = "";
  $scope.searchViewRemove = true;
  $scope.removeStatView = false;

  $scope.setRmEmployee = function(employee) {
    $scope.rmEmployee = employee;
    $scope.searchViewRemove = false;
    $scope.removeStatView = true;
  };

  $scope.finalDeleteEmployee = function() {

    $http({
			method  : 'POST',
			url     : '/manager/deleteemployee',
			data    : {
				ssn : $scope.rmEmployee.ssn
			}
		})
    .success(function(data) {
      if(data.status === "OK"){
        alert("Employee has been removed");
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

    var searchSSN = "";
    if($scope.editEmployeeView) {
      searchSSN = $scope.searchEdit;
    }
    else if ($scope.removeEmployeeView) {
      searchSSN = $scope.searchRemove;
    }
    $http({
			method  : 'POST',
			url     : '/manager/searchemployee',
			data    : {
				ssn : searchSSN
			}
		})
		.then(function(data) {

      if(data.data) {
        if($scope.editEmployeeView) {
          $scope.setEditEmployee(data.data);
        }
        else if ($scope.removeEmployeeView) {
          $scope.setRmEmployee(data.data);
        }
      }
      else {
        alert("Employee was not found");
      }
		});
  };

  $scope.backToSearch = function() {
    if($scope.editEmployeeView) {
      $scope.searchView = true;
      $scope.editEmployeeViewForm = false;
      $scope.editEmployee = null;
    }
    else if ($scope.removeEmployeeView) {
      $scope.searchViewRemove = true;
      $scope.removeStatView = false;
      rmEmployee = null;
    }
  };


  $scope.changeNewEmployeeView = function() {
    $scope.newEmployeeView = true;
    $scope.editEmployeeView = false;
    $scope.removeEmployeeView = false;
    $scope.header = "Add New Employee";
  };



   $scope.changeEditEmployeeView = function() {
     $scope.newEmployeeView = false;
     $scope.editEmployeeView = true;
     $scope.removeEmployeeView = false;
     $scope.header = "Edit An Employee";
   };

   $scope.changeRemoveEmployeeView = function() {
     $scope.newEmployeeView = false;
     $scope.editEmployeeView = false;
     $scope.removeEmployeeView = true;
     $scope.header = "Remove An Employee";
   };

 });
