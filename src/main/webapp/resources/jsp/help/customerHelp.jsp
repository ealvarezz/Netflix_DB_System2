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



    <script type="text/javascript">customer_Lock();</script>

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
	  <div ng-controller="navCtrl" ng-include="'/resources/jsp/navbar.html'"></div>

	  <div class = "container" ng-controller ="indexCtrl">

<ul>
  <li>
    <h3>Browse</h3>
    <p>
      Browse through our collection movies either by:
    </p>
<ul>
<li>The categories by genre</li>
<li>Search for a keyword</li>
<li>Movies Recommended for you</li>
<li>Or just look at a big list of all movies</li>
</ul>
<p>You can also add the movies you want to see in a wishlist</p>
</li>
<br/>

<li>
  <h3>Wishlist</h3>
  <p>
  You can check the movies you want to see on this wishlist. Customer-Representatives
  will use your wishlist to create orders that will deliver these DVD movies to be rented.
  </p>
</li>
<br/>

<li>
  <h3>Orders</h3>
  <p>
  You can your past, current and all orders that Customer-Representatives have made for you.
  </p>
  <ul>
  <li>Under Current Orders, you can return a movie</li>
  <li>Under Past Orders, you can rate a movie</li>
  </ul>
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
  <h3>Bestsellers</h3>
  <p>
  You can check the top ten best selling movies
  </p>
</li>
<br/>
</ul>


<img id="logo" src="/Logo.png" class="center-block">

	  </div>
  </body>
</html>
