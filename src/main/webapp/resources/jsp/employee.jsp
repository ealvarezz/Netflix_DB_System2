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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
    <script src="/resources/js/app.js"></script>
    <script src="/resources/js/controller/employeeCtrl.js"></script>

    <script type="text/javascript">employee_Lock();</script>

  </head>
  <style>

  body {
    background-color: #a6a6a6;
  }

  #logo{
    width: 400px;
    length: 400px;

  }
  .green_button{
      background-color: #1f7a1f;
  }

  #greeting{
    color: #e6e6e6;
  }

  </style>

  <body ng-app="FuegoVideo">
	  <div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
	  <div class = "container" ng-controller ="employeeCtrl">
      <div id = "greeting">
        <h1>{{username}}</h1>
  		  <h1>{{position}}</h1>

  		  THE EMPLOYEE HOMEPAGE
      </div>



      <br /><br /><br />
      <img id="logo" src="/Logo.png" class="center-block">
	  </div>
  </body>
</html>
