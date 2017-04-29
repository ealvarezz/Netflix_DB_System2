


app.controller('indexCtrl', function ($scope,$http,$window) {
	$scope.username = $window.localStorage.getItem('username');
});

