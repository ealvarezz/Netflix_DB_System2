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
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.angularjs.org/1.5.5/angular-cookies.min.js"></script>
		<script src="/resources/js/app.js"></script>
		<script src="/resources/js/controller/manager/viewOrdersCtrl.js"></script>



    <script type="text/javascript">manager_Lock();</script>
		<style>
		.changeBtn
		{
			border: 1px solid black;
		}

    .nameView
    {
      margin-bottom: 2%;
    }


		</style>




	</head>

	<body ng-app="FuegoVideo">
		<div ng-controller="navCtrl" ng-include="'/resources/jsp/empnavbar.html'"></div>
		<div class = "container" ng-controller ="viewOrdersCtrl">

        <div class ="row">
           <div class="col-md-6 col-md-offset-3">
             <form class="form-horizontal" method="POST">

              <div class="col-md-10 col-md-offset-2 nameView" ng-show="NameSearchView">
              <h4>Customer Name</h4>
               <div class="form-inline">
                 <input type="text" placeholder ="First Name"
                 ng-model="searchFName" class="form-control searchbar" name="searchfName" />

                 <input type="text" placeholder ="Last Name"
                 ng-model="searchLName" class="form-control searchbar" name="searchlName" />
               </div>
             </div>


              <div class="form-group" ng-show="MovieSearchView">
                <div class="col-md-8 col-md-offset-4">
                  <label for="text">Search For Movie Keyword</label>
                </div>
                <input type="text" ng-model="searchText" class="form-control searchbar" name="searchText" />
              </div>


              <div class="form-group">
              <div class="col-md-10 col-md-offset-4"><h4>Search By:</h4></div>

              <div class="col-md-9 col-md-offset-2">
              <label class="radio-inline"> <input type="radio" name="optradio" checked="checked"
                id="removeMovie" class ='viewSelection' ng-click="changeCustomerView()">
                Customer Name
              </label>
              <label class="radio-inline"><input type="radio"
                name="optradio" id="newMovie" class ='viewSelection' ng-click="changeMovieNameView()">
                Movie Name
              </label>
              <label class="radio-inline"> <input type="radio" name="optradio"
                id="editMovie" class ='viewSelection' ng-click="changeMovieGenreView()">
                Movie Genre
              </label>
              </div>
            </div>



              <div class="text-center">
                <button type="button" class ="btn-primary btn-mid" ng-click="search()" >
                  Search
                </button>
              </div>

            </form>
           </div>
        </div>




      <form id="selector viewSelection">

      </form>





			<div class = "currentOrderView">
				<div class="jumbotron vertical-center">
					<h3>{{optionHeader}}</h3>
					<div ng-repeat="x in orders" >
						<div class="well">
							<h2>Movie: {{x.movie.name}}</h2>
							<h3>Genre: {{x.movie.movieType}}</h3>
							<h3>Order On: {{x.ree}} </h3>
              <h3>Customer Email: {{x.customerId}} </h3>

							<div ng-if="x.state == 'Held'">
							  <h2>Currently Being Held</h2>
						  </div>

							<div ng-if="x.state == 'Returned'">
								<h3>Return Date: {{x.returnDate}}</h3>
							</div>

						</div>
						</div>
					</div>
				</div>



			<div class="col-xs-12" style="height:50px;"></div>
		</div>
	</body>
</html>
