<%@ include file="include.jsp" %>

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

  <body ng-app = "FuegoVideo">

    <div class = "login">
    <a href="CustomerList.jsp">Attempt to go to CustomerList/jsp</a>

    <div class = "container" ng-controller = "loginCtrl">
      <div class="jumbotron vertical-center">
        <h2>Log In</h2>
        <form class="form-horizontal">
          <div class="form-group">
            <label for="Username">Email/Username</label>
            <input type="text" ng-model="username" class="form-control" name="Username" />
          </div>
          <div class="form-group">
            <label for="Password">Password</label>
            <input type="password" ng-model="password" class="form-control" name="Password" />
          </div>
          <div class="text-right">
            <button type="button" class ="btn-primary btn-mid" ng-click="login()" >
              Log in
            </button>
          </form>
      </div>
      </div>

      <div class = "jumbotron vertical-center">
        <pre><h2>{{words}}</h2></pre>
      </div>
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
        <script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
    <script src="/resources/js/app.js"></script>
    <script src="/resources/js/controller/loginCtrl.js"></script>
  </body>
</html>
