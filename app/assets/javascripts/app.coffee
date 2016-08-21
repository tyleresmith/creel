creel = angular.module('creel',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

creel.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'FishController'
      ).when('/fish/:fishId',
        templateUrl: "show.html",
        controller: 'FishController'
      )
])

controllers = angular.module('controllers',[])
