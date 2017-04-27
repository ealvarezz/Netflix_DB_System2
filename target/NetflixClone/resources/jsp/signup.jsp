<%@ include file="/resources/jsp/include.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Fuego Video</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
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
    <form class="form-horizontal">
      <div class="form-group">
        <label for="FirstName">First Name</label>
        <input type="text" class="form-control" name="FirstName" />
      </div>

      <div class="form-group">
        <label for="LastName">Last Name</label>
        <input type="text" class="form-control" name="LastName" />
      </div>

      <div class="form-group">
        <label for="Address">Address</label>
        <input type="text" class="form-control" name="Address" />
      </div>

      <div class="form-group">
        <label for="City">City</label>
        <input type="text" class="form-control" name="City" />
      </div>

      <div class="form-group">
        <label for="State">State</label>
        <input type="text" class="form-control" name="State" />
      </div>

      <div class="form-group">
        <label for="Zip">ZipCode</label>
        <input type="text" class="form-control" name="Zip" />
      </div>

      <div class="form-group">
        <label for="Telephone">Telephone</label>
        <input type="tel" class="form-control" name="Telephone" />
      </div>

      <div class="form-group">
        <label for="Email">Email</label>
        <input type="email" class="form-control" name="Email" />
      </div>

      <div class="form-group">
        <label for="Password">Password</label>
        <input type="password" class="form-control" name="Password" />
      </div>

      <div class="form-group">
        <label for="CreditCard">Credit Card Number</label>
        <input type="phone" class="form-control" name="Password" />
      </div>

      <button class ="btn-primary btn-mid" id="submit" ng-click="CreateCustomer()" >
        Submit
      </button>
    </form>
  </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/app.js"></script>
<script src="/resources/js/controller/loginCtrl.js"><script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
</body>
</html>
