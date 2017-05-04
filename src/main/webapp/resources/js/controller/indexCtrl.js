


app.controller('indexCtrl', function ($scope,$http,$window) {
	$scope.username = $window.localStorage.getItem('username');
	
	$scope.goToBrowse = function(){
		window.location.href = '/browse';
		
	}
});

