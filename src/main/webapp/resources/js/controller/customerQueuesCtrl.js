

app.controller('customerQueuesCtrl', function ($scope,$http,$window) {


	$scope.wish_orders = [];
	$scope.customers = [];
	$scope.selected_user = null;

	$http({
		method  : 'GET',
		url     : '/geteligiblecustomers'
	})
		.then(function(data) {
			$scope.customers = data.data;
		});




	$scope.list_orders = function() {
		$http({
			method  : 'POST',
			url     : '/getwishlist',
			data    : {
				email : $scope.selected_user.customer.email
			}
		})
		.then(function(data) {
			$scope.wish_orders = data.data;
		});
	};


	$scope.process_movie = function(movieId) {

	    console.log(movieId);
	    console.log($scope.selected_user.customer.email);

	    console.log($window.localStorage.getItem('username'));
		$http({
			method  : 'POST',
			url     : '/process_order',
			data    : {
				customerId: $scope.selected_user.customer.email,
				employeeId: $window.localStorage.getItem('username'),
				movieId: movieId
			}
		})
		.then(function(data) {
			if(!(data.data.status === "error")){
				var k = 0;
				for(k = 0; k < $scope.wish_orders.length; k++ ){
					if(movieId === $scope.wish_orders[k].id){
						$scope.wish_orders.splice(k,1);
					}
				}
			}else{
				alert("User can not have any more movies.");
			}
		});

	};

});
