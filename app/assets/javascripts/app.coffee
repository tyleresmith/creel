creel = angular.module('creel',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'ngMessages',
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
      ).when('/trips',
        templateUrl: 'trip/index.html',
        controller: 'TripController'
      ).when('/trips/new',
        templateUrl: 'trip/form.html'
        controller: 'TripController'
      ).when('/trips/:tripId',
        templateUrl: 'trip/show.html',
        controller: 'TripController'
      ).when('/trips/:tripId/edit',
        templateUrl: 'trip/form.html',
        controller: 'TripController'
      ).when('/trips/:tripId/catches/new',
        templateUrl: 'catch/form.html'
        controller: 'CatchController'
      ).when('/trips/:tripId/catches/:catchId',
        templateUrl: 'catch/show.html',
        controller: 'CatchController'
      ).when('/trips/:tripId/catches/:catchId/edit',
        templateUrl: 'catch/form.html'
        controller: 'CatchController'
      ).otherwise({ redirectTo: '/' })
])

controllers = angular.module('controllers',[])
