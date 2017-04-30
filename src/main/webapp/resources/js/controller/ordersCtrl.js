


app.controller('ordersCtrl', function ($scope,$http,$window) {

	$scope.email = $window.localStorage.getItem('username');

	$scope.cur_orders = [];
	$scope.wish_orders = [];

	$scope.list_orders = function() {
		$http({
			method  : 'POST',
			url     : '/getcustomerorders',
			data    : { 
				//email : $scope.email
				email : "pml@cs.sunysb.edu"
			}
		})
		.then(function(data) {
			var k = 0;
			var re = null;
			for(k; k < data.data.length; k++){
				re = new Date(data.data[k].timeDate);
				data.data[k].ree = re.toLocaleString();
			}
			$scope.cur_orders = data.data;
		});
		$http({
			method  : 'POST',
			url     : '/getwishlist',
			data    : { 
				//email : $scope.email
				email : "pml@cs.sunysb.edu"
			}
		})
		.then(function(data) {
			$scope.wish_orders = data.data;
		});
	};

	$scope.list_orders();
	
	$scope.return_movie = function(movieId) {
		alert(movieId);
	};

});
