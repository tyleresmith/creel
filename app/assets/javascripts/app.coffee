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
      )
])

controllers = angular.module('controllers',[])
