<%@ include file="/resources/jsp/include.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Fuego Video</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/resources/js/app.js"></script>
    <script src="/resources/js/controller/signUpCtrl.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
  </head>
  <style>

    .jumbotron
    {
      margin: 25%;
      margin-top: 5%;
      /*color:white;
      background-color:#E50914;*/
    }
  </style>

  <body>
	  <div ng-controller = 'NewCustomer' class = "signup">
		  <div class = "container">
			  <div class="jumbotron vertical-center">
				  <h2>Sign Up</h2>
				  <form class="form-horizontal" method="POST">
					  <div class="form-group">
						  <label for="FirstName">First Name</label>
						  <input type="text" class="form-control" name="FirstName" required />
					  </div>

					  <div class="form-group">
						  <label for="LastName">Last Name</label>
						  <input type="text" class="form-control" name="LastName" required />
					  </div>

					  <div class="form-group">
						  <label for="Address">Address</label>
						  <input type="text" class="form-control" name="Address" required />
					  </div>

					  <div class="form-group">
						  <label for="City">City</label>
						  <input type="text" class="form-control" name="City" required />
					  </div>

					  <div class="form-group">
						  <label for="State">State</label>
						  <input type="text" class="form-control" name="State" required />
					  </div>

					  <div class="form-group">
						  <label for="Zip">ZipCode</label>
						  <input type="text" class="form-control" name="Zip" required />
					  </div>

					  <div class="form-group">
						  <label for="Telephone">Telephone</label>
						  <input type="tel" class="form-control" name="Telephone" required />
					  </div>

					  <div class="form-group">
						  <label for="Email">Email</label>
						  <input type="email" class="form-control" name="Email" required />
					  </div>

					  <div class="form-group">
						  <label for="Password">Password</label>
						  <input type="password" class="form-control" name="Password" required />
					  </div>

					  <div class="form-group">
						  <label for="CCN">Credit Card Number</label>
						  <input type="number" class="form-control" name="CCN" required />
					  </div>

					  <button class ="btn-primary btn-mid" id="submit" ng-click="CreateCustomer()" >
						  Submit
					  </button>
				  </form>
			  </div>
		  </div>
	  </div>
  </body>
</html>
