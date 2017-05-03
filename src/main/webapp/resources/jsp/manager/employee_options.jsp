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

          <div class = "viewSelection" ng-show="newEmployeeView">
					<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="FirstName">First Name</label>
							<input type="text" class="form-control" ng-model="firstname"
              name="FirstName" required />
						</div>

						<div class="form-group">
							<label for="LastName">Last Name</label>
							<input type="text" class="form-control" ng-model="lastname" name="lastname" required />
						</div>

						<div class="form-group">
							<label for="Address">Address</label>
							<input type="text" class="form-control" ng-model="address" name="Address" required />
						</div>

						<div class="form-group">
							<label for="City">City</label>
							<input type="text" class="form-control" ng-model="city" name="City" required />
						</div>

						<div class="form-group">
							<label for="State">State</label>
							<input type="text" class="form-control" ng-model="state" name="State" required />
						</div>

						<div class="form-group">
							<label for="Zip">ZipCode</label>
							<input type="text" class="form-control" ng-model="zipcode" name="Zip" required />
						</div>

						<div class="form-group">
							<label for="Telephone">Telephone</label>
							<input type="tel" class="form-control" ng-model="telephone" name="Telephone" required />
						</div>

						<div class="form-group">
							<label for="ssn">SSN or Employee Id</label>
							<input type="text" class="form-control" ng-model="ssn" name="ssn" required />
						</div>

						<div class="form-group">
							<label for="Password">Password</label>
							<input type="password" class="form-control" ng-model="password" name="Password" required />
						</div>

            <div class="form-group">
							<label for="hourlyRate">Hourly Rate</label>
							<input type="text" class="form-control" ng-model="hourlyRate" name="hourlyRate" required />
						</div>
						<button class ="btn-primary btn-mid" id="submit" ng-click="createEmployee()" >
							Submit
						</button>
					</form>
				</div> <!--End of newEmployeeView div -->

        <!------------------------------------------------------------------>



        <div class = "viewSelection" ng-show="editEmployeeView">
        <div class = "searchView" ng-show="searchView">
          <form class="form-horizontal" method="POST">
           <div class="form-group">
             <label for="searchEdit">Search Employee</label>
             <input type="text" ng-model="searchEdit" class="form-control" name="searchEdit" />
           </div>
           <div class="form-group">
             <div class="text-right">
               <button type="button" class ="btn-primary btn-mid" ng-click="searchBtn()" >
                 Search
               </button>
             </div>
           </div>
           </form>
          </div>

					<div class = "viewSelection" ng-show="editEmployeeViewForm">

					<div class="row backSearchBtn" ng-show="backSearchBtn">
						 <div class="col-lg-8 col-lg-offset-3">
							<button type="button" class ="btn-primary btn-mid" ng-click="backToSearch()" >
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								Search Another Employee
							</button>
						</div>
					</div>

					<form class="form-horizontal editEmployee" method="POST">
						<div class="form-group">
							<label for="editFirstName">First Name</label>
							<input type="text" class="form-control" ng-model="editEmployee.firstName"
              name="editFirstname" required />
						</div>

						<div class="form-group">
							<label for="editFirstname">Last Name</label>
							<input type="text" class="form-control" ng-model="editEmployee.lastName" name="lastName" required />
						</div>

						<div class="form-group">
							<label for="editAddress">Address</label>
							<input type="text" class="form-control" ng-model="editEmployee.address" name="editAddress" required />
						</div>

						<div class="form-group">
							<label for="editCity">City</label>
							<input type="text" class="form-control" ng-model="editEmployee.city" name="City" required />
						</div>

						<div class="form-group">
							<label for="editState">State</label>
							<input type="text" class="form-control" ng-model="editEmployee.state" name="editState" required />
						</div>

						<div class="form-group">
							<label for="editZip">ZipCode</label>
							<input type="text" class="form-control" ng-model="editEmployee.zip" name="editZip" required />
						</div>

						<div class="form-group">
							<label for="editTelephone">Telephone</label>
							<input type="tel" class="form-control" ng-model="editEmployee.telephone" name="editTelephone" required />
						</div>

						<div class="form-group">
							<label for="editSsn">SSN or Employee Id</label>
							<input type="text" class="form-control" ng-model="editEmployee.ssn" name="editSsn" required />
						</div>

						<div class="form-group">
							<label for="editPassword">Password</label>
							<input type="password" class="form-control" ng-model="editEmployee.password" name="editPassword" required />
						</div>

            <div class="form-group">
							<label for="editHourlyRate">Hourly Rate</label>
							<input type="text" class="form-control" ng-model="editEmployee.hourlyRate" name="editHourlyRate" required />
						</div>

						<button class ="btn-primary btn-mid" id="submit" ng-click="editEmployeeInDb()" >
							Submit
						</button>
					</form>
				</div> <!--End of editEmployeeView div -->
        </div>


				<div class = "viewSelection" ng-show="removeEmployeeView">
        <div class = "searchView" ng-show="searchViewRemove">

          <form class="form-horizontal" method="POST">
           <div class="form-group">
             <label for="search">Search Employee</label>
             <input type="text" ng-model="searchRemove" class="form-control" name="searchRemove" />
           </div>
           <div class="form-group">
             <div class="text-right">
               <button type="button" class ="btn-primary btn-mid" ng-click="searchBtn()" >
                 Search
               </button>
             </div>
           </div>
           </form>
          </div>

					<div class = "removeStatView" ng-show="removeStatView">
						<div class="row backSearchBtn" ng-show="backSearchBtn">
							 <div class="col-lg-8 col-lg-offset-3">
								<button type="button" class ="btn-primary btn-mid" ng-click="backToSearch()" >
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									Search Another Employee
								</button>
							</div>
						</div>
						<div id="delEmployeeStats">
							<h2>Name: {{rmEmployee.firstName}} {{rmEmployee.lastName}}</h2>
							<h3>Employee ID: {{rmEmployee.ssn}}
							<h3>HourlyRate: ${{rmEmployee.hourlyRate}}</h3>
							<h3>StartDate: {{rmEmployee.startDate}}</h3>
						</div>
						<button type="button" class="btn-danger btn-mid" ng-click="finalDeleteEmployee()" >
							Delete Employee
						</button>
					</div>
			</div> <!-- End for removeEmployeeView -->
		</div>
  </div>
	</body>
</html>
