creel = angular.module('creel',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

creel.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")
    
    $routeProvider
      .when('/',
        templateUrl:'user/show.html'
        controller: 'UserController'
      ).when('/fish',
        templateUrl: "fish/index.html"
        controller: 'FishController'
      ).when('/fish/new',
        templateUrl: 'fish/form.html'
        controller: 'FishController'
      ).when('/fish/:fishId',
        templateUrl: "fish/show.html"
        controller: 'FishController'
      ).when('/fish/:fishId/edit',
        templateUrl: 'fish/form.html'
        controller: 'FishController'
      ).when('/trip',
        templateUrl: 'trip/index',
        controller: 'TripController'
      ).when('/trip/new',
        templateUrl: 'trip/new'
        controller: 'TripController'
      ).when('trip/:tripId',
        templateUrl: 'trip/show',
        controller: 'TripController'
      ).when('trip/:tripId/edit',
        templateUrl: 'trip/form',
        controller: 'TripController'
      ).when('catch/new',
        templateUrl: 'catch/form'
        controller: 'CatchController'
      ).when('catch/:catch:id/edit',
        templateUrl: 'catch/form'
        controller: 'CatchController'
      )
])

controllers = angular.module('controllers',[])
