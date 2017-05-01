
app.controller('addMovieCtrl', function ($scope,$http,$window) {

   $scope.movieName = "";
   $scope.movieType = "";
   $scope.fee = "";
   $scope.numcopies = "";
   $scope.rating = "";
   $scope.header = "Add New Movie";


   $scope.newMovie = function() {
     $scope.header = "Add New Movie";
   };

   $scope.moreCopies = function() {
     $scope.header = "Add More Copies Of A Movie";
   };

   $scope.submitMovie = function() {

     alert($scope.movieName.$valid);
      var movieVar =
   		 {
         movie: {
   				name : $scope.movieName,
   				movieType : $scope.movieType,
   				fee : $scope.fee,
   				numCopies : $scope.numcopies,
   				rating : $scope.rating
   			  }
       };


     $http({
		   method  : 'POST',
		   url     : '/addMovie',
		   data    : movieVar
	   })
		   .success(function(data) {
			   if(data.status === "OK"){
           alert("You now have added a movie");
			   }else{
				   alert("Your form has errors.");
			   }
		   })
		   .error(function(data){
		   });
   };


   $scope.submitCopy = function() {
     var movieVar =
      {
        movie: {
         name : $scope.movieName,
         movieType : NULL,
         fee : NULL,
         numCopies : $scope.numcopies,
         rating : NULL
         }
      };


    $http({
      method  : 'POST',
      url     : '/addMovie',
      data    : movieVar
    })
      .success(function(data) {
        if(data.status === "OK"){
          alert("You now have added a movie");
        }else{
          alert("Your form has errors.");
        }
      })
      .error(function(data){
      });

   };
});
