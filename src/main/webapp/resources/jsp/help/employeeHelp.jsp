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
    <script src="/resources/js/controller/indexCtrl.js"></script>



    <script type="text/javascript">employee_Lock();</script>

    <style>
    
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

  </head>

  <body ng-app="FuegoVideo">
	  <div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>

	  <div class = "container" ng-controller ="navCtrl">

    <div class="row">
      <div class="col-lg-12 col-lg-offset-5">
        <h2>Emplyee Option</h2>
      </div>
    </div>
<ul>
<li>
  <h3>Queues</h3>
  <p>
  The employee can get the wishlist of any customer that is available
  (according to their account type) to make an order.
  </p>
</li>
<br/>

<li>
  <h3>Customer Options</h3>
  <p>
    From here an employee can add or delete customers. They can also edit the
    customer’s information including their account type.
  </p>
</li>
<br/>


<li>
  <h3>Account</h3>
  <p>
  You can change the setting of your account including your name, credit card, or account type.
  </p>
</li>
<br/>

<li>
  <h3>Customer Mailing List</h3>
  <p>
  Get the addresses of all customers.
  </p>
</li>
<br/>
</ul>
<br/><br/><br/>

<div>
  <div class="row">
    <div class="col-lg-12 col-lg-offset-5">
      <h2>Manager Options</h2>
    </div>
    <div class="col-lg-12 col-lg-offset-2">
    <p>
      The managers have their own actions to pick at the top navigation bar on the top.
      Theycan also perform Employee action stated above also.
    </p>
  </div>
  </div>
</div>
<br/>


<br /><br />

<ul>
<li>
  <h3>Employee Options</h3>
  <p>
  From here a manager can add or delete employees. They can also edit the
  employee information including their hourly rate.
  </p>
</li>
<br/>

<li>
  <h3>Activity Options</h3>
  <p>
    The manager can certain activities throughout the business including
  </p>
<ul>
<li>The most active rented movies</li>
<li>The most active customers renting movies</li>
<li>The most active Employees that is involved in most orders</li>
</ul>
</li>
<br/>

<li>
  <h3>Movie Options</h3>
  <p>
  From here a manager can add or delete Movies. They can also edit the employee
  information such as their distribution fee or number of copies.
  </p>
</li>

<li>
  <h3>View Orders</h3>
  <p>
  The Manager can search orders by the customer’s name, a keyword of movies,
  or the movie genre
  </p>
</li>
</ul>


<img id="logo" src="/Logo.png" class="center-block">

	  </div>
  </body>
</html>
