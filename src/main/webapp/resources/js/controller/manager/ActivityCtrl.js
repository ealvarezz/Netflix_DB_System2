app.controller('ActivityCtrl', function ($scope,$http,$window) {
	
	$scope.header = "View Movie Activity";
	$scope.movieView = true;
	
	
	/* ############################################################################################# */
	/* ##########################################  MOVIES  ######################################### */
	/* ############################################################################################# */
	
	$scope.getActiveMovies = function() {
		
		console.log($scope.limit);
	    $http({
	      method  : 'POST',
	      url     : '/manager/activemovies',
	      data    : {limit: $scope.limit}
	    })
	      .success(function(data) {
	    
	    	  $scope.movies = data;
	      })
	      .error(function(data){
	        alert('WENT DOWN');
	        alert(data);
	      });
	  };
	
	/* ############################################################################################# */
	/* ######################################  CUSTOMERS   ######################################### */
	/* ############################################################################################# */
	
	  $scope.getActiveCustomers = function() {
			
	
		    $http({
		      method  : 'POST',
		      url     : '/manager/activeusers',
		      data    : {limit: $scope.climit}
		    })
		      .success(function(data) {
		    
		    	  $scope.customers = data;
		      })
		      .error(function(data){
		        alert('WENT DOWN');
		        alert(data);
		      });
		  };
	
	/* ############################################################################################# */
	/* ######################################  EMPLOYEES   ######################################### */
	/* ############################################################################################# */
	
		  $scope.getActiveEmployee = function() {
				
				
			    $http({
			      method  : 'GET',
			      url     : '/manager/getactiveemployee'
			    })
			      .success(function(data) {
			    
			    	  $scope.employee = data;
			      })
			      .error(function(data){
			        alert('WENT DOWN');
			        alert(data);
			      });
			  };
		  
		  
	$scope.changeMovieView = function() {
	    $scope.movieView = true;
	    $scope.customerView = false;
	    $scope.employeeView = false;
	    $scope.header = "View Movie Activity";
	};



	$scope.changeCustomerView = function() {
		   $scope.movieView = false;
		   $scope.customerView = true;
		   $scope.employeeView = false;
		   $scope.header = "View Customer Activity";
	};

	$scope.changeEmployeeView = function() {
		   $scope.movieView = false;
		   $scope.customerView = false;
		   $scope.employeeView = true;
		   $scope.header = "View Employee Activity";
		   $scope.getActiveEmployee();
	};
	
});