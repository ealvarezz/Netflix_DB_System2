


app.controller('ordersCtrl', function ($scope,$http,$window) {



	$scope.email = $window.localStorage.getItem('username');
	$scope.orders = [];
	$scope.optionHeader = "";


	$scope.pastBtn = false;
	$scope.currentBtn = true;
	$scope.allBtn = false;

	$scope.current_orders = function() {
		$http({
			method  : 'POST',
			url     : '/getcustomerorders',
			data    : {
				email : $scope.email
			}
		})
		.then(function(data) {
			var k = 0;
			var re = null;
			for(k; k < data.data.length; k++){
				re = new Date(data.data[k].timeDate);
				data.data[k].ree = re.toLocaleString();
			}

			$scope.optionHeader = "CURRENTLY HELD ORDERS";
			$scope.orders = data.data;
			disableBtns(false,true,false);
		});
		$http({
			method  : 'POST',
			url     : '/getwishlist',
			data    : {
				email : $scope.email
			}
		})
		.then(function(data) {
			$scope.wish_orders = data.data;
		});
	};

	$scope.current_orders();

	$scope.return_movie = function(movieId) {

		$http({
			method  : 'POST',
			url     : '/returnmovie',
			data    : {
				movieId: movieId,
				customerId : $scope.email
			}
		})
		.then(function(data) {
			var k = 0;

			for(k = 0; k < $scope.orders.length; k++ ){
				if(movieId === $scope.orders[k].movieId){
					$scope.orders.splice(k,1);
				}
			}
			alert("Movie returned.");
		});
	};

	$scope.past_orders = function() {
		$http({
			method  : 'POST',
			url     : '/getpastcustomerorders',
			data    : {
				email : $scope.email
			}
		})
		.then(function(data) {
			var k = 0;
			var re = null;
			for(k; k < data.data.length; k++){
				re = new Date(data.data[k].timeDate);
				data.data[k].ree = re.toLocaleString();
			}

			$scope.optionHeader = "PAST ORDERS";
			$scope.orders = data.data;
			disableBtns(true,false,false);
		});
	};

		$scope.all_orders = function() {
			$http({
				method  : 'POST',
				url     : '/getallcustomerorders',
				data    : {
					email : $scope.email
				}
			})
			.then(function(data) {
				var k = 0;
				var re = null;
				for(k; k < data.data.length; k++){
					re = new Date(data.data[k].timeDate);
					data.data[k].ree = re.toLocaleString();
				}
				$scope.optionHeader = "ALL ORDERS";
				$scope.orders = data.data;
				disableBtns(false,false,true);
			});
		};




	/********************************************************/

	$scope.changePastOrderView = function() {
    $scope.pastOrderView = true;
    $scope.currentOrderView = false;
    $scope.allOrderView = false;
    $scope.header = "Add Past Order";
  };


   $scope.changeCurrentOrderView = function() {
     $scope.pastOrderView = false;
     $scope.currentOrderView = true;
     $scope.allOrderView = false;
     $scope.header = "Current An Order";
   };

   $scope.changeAllOrderView = function() {
     $scope.pastOrderView = false;
     $scope.currentOrderView = false;
     $scope.allOrderView = true;
     $scope.header = "All An Order";
   };

	 disableBtns = function(v1,v2,v3) {
		 $scope.pastBtn = v1;
	 	 $scope.currentBtn = v2;
	 	 $scope.allBtn = v3;
	 };

});
