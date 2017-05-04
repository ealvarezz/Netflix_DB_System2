app.controller('viewOrdersCtrl', function ($scope,$http,$window) {

  $scope.searchFName = "";
  $scope.searchLName = "";
  $scope.searchText = "";
  $scope.optionHeader = "";

  $scope.NameSearchView = true;
  $scope.MovieSearchView = false;
  selectedView = "Customer";


  $scope.changeCustomerView = function() {
    $scope.NameSearchView = true;
    $scope.MovieSearchView = false;
    selectedView = "Customer";
  };

  $scope.changeMovieNameView = function() {
    $scope.NameSearchView = false;
    $scope.MovieSearchView = true;
    selectedView = "Movie Name";
  };

  $scope.changeMovieGenreView = function() {
    $scope.NameSearchView = false;
    $scope.MovieSearchView = true;
    selectedView = "Movie Type";
  };

  getMoviesByCustomerName = function() {
    $http({
      method  : 'POST',
      url     : '/manager/ordersbycustomer',
      data    : {
        firstName: $scope.searchFName,
        lastName: $scope.searchLName
      }
    })
    .then(function(data) {
      var k = 0;
      var re = null;
      for(k; k < data.data.length; k++){
        re = new Date(data.data[k].timeDate);
        data.data[k].ree = re.toLocaleString();
      }
      $scope.optionHeader = "Orders from " + $scope.searchFName + " " + $scope.searchLName;
      $scope.orders = data.data;
    });
  };

  getMoviesByName = function() {
    $http({
      method  : 'POST',
      url     : '/manager/ordersbyname',
      data    : {
        name : $scope.searchText
      }
    })
    .then(function(data) {
      var k = 0;
      var re = null;
      for(k; k < data.data.length; k++){
        re = new Date(data.data[k].timeDate);
        data.data[k].ree = re.toLocaleString();
      }
      $scope.orders = data.data;
      $scope.optionHeader = "Orders with movie named " + $scope.searchText;
    });
  };

  getMoviesByGenre = function() {
    $http({
      method  : 'POST',
      url     : '/manager/ordersbytype',
      data    : {
        movieType : $scope.searchText
      }
    })
    .then(function(data) {
      var k = 0;
      var re = null;
      for(k; k < data.data.length; k++){
        re = new Date(data.data[k].timeDate);
        data.data[k].ree = re.toLocaleString();
      }
      $scope.optionHeader = "Orders with genre of " + $scope.searchText;
      $scope.orders = data.data;
    });
  };

  $scope.search = function() {

    if(selectedView=="Customer") {
      getMoviesByCustomerName();
    }
    else if(selectedView=="Movie Name") {
      getMoviesByName();
    }
    else if (selectedView=="Movie Type") {
      getMoviesByGenre();
    }
  };
});
