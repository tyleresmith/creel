creel = angular.module('creel',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers'
])

creel.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'FishController'
      )
])

controllers = angular.module('controllers',[])
