<div class = "viewSelection" ng-show="editMovieView">
<div class = "searchView" ng-show="searchView">

  <h3 ng-model="searchfor">{{searchfor}}</h3>
  <div ng-repeat="y in movies">
    <div class="well">
      <h2>Movie: {{y.name}}</h2>
      <h3>Number of copies: {{y.numCopies}}   fee: {{y.fee}}   Genre: {{y.movieType}}</h2>
      <button type="button" class="btn-primary btn-mid" ng-click="add_movie(y.id)" >
        View Movie
      </button>
