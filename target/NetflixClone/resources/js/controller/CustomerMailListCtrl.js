
angular.module('FuegoVideo',[]).controller('CustomerMailListCtrl', function ($scope,$http) {

   $scope.list = "";

$scope.loadCustomerMailList = function(){

	$http({
          method  : 'GET',
          url     : '/allcustomerList',
         })
          .success(function(data) {
          		$scope.list = data.slice();
          });
};

$scope.loadCustomerMailList();
});
