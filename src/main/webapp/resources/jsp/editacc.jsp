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
		<script src="/resources/js/controller/editAcctCtrl.js"></script>



    <script type="text/javascript">customer_Lock();</script>



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

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>
		<div class = "info" ng-controller = "editAcctCtrl" >
			<div class = "container">
				<div class="jumbotron vertical-center">
					<h2>ACCOUNT INFORMATION</h2>
					<form class="form-horizontal" method="POST">
						<div class="form-group">
							<label for="FirstName">First Name</label>
							<input type="text" class="form-control" ng-model="firstname" name="FirstName" required />{{firstname}}
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
								<input type="radio" ng-model="plan" ng-value="unlimited-1">
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




						<button class ="btn-primary btn-mid" id="submit" ng-click="update_acc()" >
							Update Information
						</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
