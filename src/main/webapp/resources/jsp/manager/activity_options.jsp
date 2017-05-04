<%@ include file="/resources/jsp/include.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Fuego Video</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
		<script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/resources/js/app.js"></script>
		<script src="/resources/js/controller/manager/employee_optionsCtrl.js"></script>
		<script type="text/javascript">manager_Lock();</script>
	</head>
	<style>
.jumbotron
{
	margin: 25%;
	margin-top: 5%;
	/*color:white;
	  background-color:#E50914;*/
}

.viewSelection
{
  margin-top: 5%;
}

.removeStatView
{
	margin-top: 5%;
}

.backSearchBtn
{
	padding-bottom: 5%;
	border-bottom: 5px solid #000000;
}

.editEmployee
{
	margin-top: 5%;
	margin-bottom: 2%;
}

	</style>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
		<div class = "employee_options" ng-controller = "employee_optionsCtrl" >
			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>{{header}}</h2>

              <form id="selector viewSelection">
                <label class="radio-inline"><input type="radio" checked="checked"
                  name="optradio" id="newEmployee" class ='viewSelection' ng-click="changeNewEmployeeView()">
                  New Employee
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="editEmployee" class ='viewSelection' ng-click="changeEditEmployeeView()">
                  Edit an Employee
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="removeEmployee" class ='viewSelection' ng-click="changeRemoveEmployeeView()">
                  Remove an Employee
                </label>
              </form>
		</div> 
		</div>
  </div>
	</body>
</html>