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
        templateUrl: "index.html"
        controller: 'FishController'
      ).when('/fish/:fishId',
        templateUrl: "show.html",
        controller: 'FishController'
      )
])

controllers = angular.module('controllers',[])
