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
		<script src="/resources/js/controller/employee/customer_optionsCtrl.js"></script>
		<script type="text/javascript">employee_Lock();</script>
	</head>
	<style>
.jumbotron
{
	margin: 15%;
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

.editCustomer
{
	margin-top: 5%;
	margin-bottom: 2%;
}

	</style>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
		<div class = "customer_options" ng-controller = "customer_optionsCtrl" >
			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>{{header}}</h2>

              <form id="selector viewSelection">
                <label class="radio-inline"><input type="radio" checked="checked"
                  name="optradio" id="newCustomer" class ='viewSelection' ng-click="changeNewCustomerView()">
                  New Customer
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="editCustomer" class ='viewSelection' ng-click="changeEditCustomerView()">
                  Edit an Customer
                </label>
                <label class="radio-inline"> <input type="radio" name="optradio"
                  id="removeCustomer" class ='viewSelection' ng-click="changeRemoveCustomerView()">
                  Remove an Customer
                </label>
              </form>

          <div class = "viewSelection" ng-show="newCustomerView">
					<form class="form-horizontal" method="POST">
            <div class="form-group">
              <label for="FirstName">First Name</label>
              <input type="text" class="form-control" ng-model="firstname" name="FirstName" required />
            </div>

            <div class="form-group">
              <label for="LastName">Last Name</label>
              <input type="text" class="form-control" ng-model="lastname" name="LastName" required />
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
              <label for="Email">Email</label>
              <input type="email" class="form-control" ng-model="email" name="Email" required />
            </div>

            <div class="form-group">
              <label for="Password">Password</label>
              <input type="password" class="form-control" ng-model="password" name="Password" required />
            </div>

            <div class="form-group">
              <label for="CCN">Credit Card Number</label>
              <input type="text" class="form-control" ng-model="creditcard" name="CCN" required />
            </div>

            <div class="form-group">
              <label>
                <input type="radio" ng-model="plan" value="limited">
                Limited - 10$ for 2 movies month. One at a time.
              </label><br/>
              <label>
                <input type="radio" ng-model="plan" value="unlimited-1">
                Unlimited-1 - $15/month for 1 movie out at-a-time. Unlimited per month.
              </label><br/>
              <label>
                <input type="radio" ng-model="plan" value="unlimited-2">
                Unlimited-2 - $20/month for 2 movies out at-a-time. Unlimited per month.
              </label><br/>
              <label>
                <input type="radio" ng-model="plan" value="unlimited-3">
                Unlimited-3 - $25/month for 3 movies out at-a-time. Unlimited per month.
              </label><br/>
            </div>
						<button class ="btn-primary btn-mid" id="submit" ng-click="createCustomer()" >
							Submit
						</button>
					</form>
				</div> <!--End of newCustomerView div -->

        <!------------------------------------------------------------------>



        <div class = "viewSelection" ng-show="editCustomerView">
        <div class = "searchView" ng-show="searchView">
          <form class="form-horizontal" method="POST">
           <div class="form-group">
             <label for="searchEdit">Search Customer</label>
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

					<div class = "viewSelection" ng-show="editCustomerViewForm">

					<div class="row backSearchBtn" ng-show="backSearchBtn">
						 <div class="col-lg-8 col-lg-offset-3">
							<button type="button" class ="btn-primary btn-mid" ng-click="backToSearch()" >
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								Search Another Customer
							</button>
						</div>
					</div>

					<form class="form-horizontal editCustomer" method="POST">
						<div class="form-group">
							<label for="editFirstName">First Name</label>
							<input type="text" class="form-control" ng-model="editCustomer.firstName"
              name="editFirstname" required />
						</div>

						<div class="form-group">
							<label for="editFirstname">Last Name</label>
							<input type="text" class="form-control" ng-model="editCustomer.lastName" name="lastName" required />
						</div>

						<div class="form-group">
							<label for="editAddress">Address</label>
							<input type="text" class="form-control" ng-model="editCustomer.address" name="editAddress" required />
						</div>

						<div class="form-group">
							<label for="editCity">City</label>
							<input type="text" class="form-control" ng-model="editCustomer.city" name="City" required />
						</div>

						<div class="form-group">
							<label for="editState">State</label>
							<input type="text" class="form-control" ng-model="editCustomer.state" name="editState" required />
						</div>

						<div class="form-group">
							<label for="editZip">ZipCode</label>
							<input type="text" class="form-control" ng-model="editCustomer.zip" name="editZip" required />
						</div>

						<div class="form-group">
							<label for="editTelephone">Telephone</label>
							<input type="tel" class="form-control" ng-model="editCustomer.telephone" name="editTelephone" required />
						</div>

						<div class="form-group">
							<label for="editPassword">Password</label>
							<input type="password" class="form-control" ng-model="editCustomer.password" name="editPassword" required />
						</div>

            <div class="form-group">
							<label for="editcreditCard">Credit Card</label>
							<input type="text" class="form-control" ng-model="editCustomer.creditCard" name="editcreditCard" required />
						</div>


            <div class="form-group">
              <label>
                <input type="radio" ng-model="editPlan" value="limited">
                Limited - 10$ for 2 movies month. One at a time.
              </label><br/>
              <label>
                <input type="radio" ng-model="editPlan" ng-value="unlimited-1">
                Unlimited-1 - $15/month for 1 movie out at-a-time. Unlimited per month.
              </label><br/>
              <label>
                <input type="radio" ng-model="editPlan" value="unlimited-2">
                Unlimited-2 - $20/month for 2 movies out at-a-time. Unlimited per month.
              </label><br/>
              <label>
                <input type="radio" ng-model="editPlan" value="unlimited-3">
                Unlimited-3 - $25/month for 3 movies out at-a-time. Unlimited per month.
              </label><br/>
            </div>

						<button class ="btn-primary btn-mid" id="submit" ng-click="editCustomerInDb()" >
							Submit
						</button>
					</form>
				</div> <!--End of editCustomerView div -->
        </div>


				<div class = "viewSelection" ng-show="removeCustomerView">
        <div class = "searchView" ng-show="searchViewRemove">

          <form class="form-horizontal" method="POST">
           <div class="form-group">
             <label for="search">Search Customer</label>
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
									Search Another Customer
								</button>
							</div>
						</div>
						<div id="delCustomerStats">
							<h2>Name: {{rmCustomer.firstName}} {{rmCustomer.lastName}}</h2>
							<h3>Email: {{rmCustomer.email}}
							<h3>Account: {{rmPlan}}</h3>
						</div>
						<button type="button" class="btn-danger btn-mid" ng-click="finalDeleteCustomer()" >
							Delete Customer
						</button>
					</div>
			</div> <!-- End for removeCustomerView -->
		</div>
  </div>
	</body>
</html>
