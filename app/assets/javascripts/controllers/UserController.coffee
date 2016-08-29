controllers = angular.module('controllers')
controllers.controller("UserController", [ '$scope', '$routeParams', '$location', '$resource', 'flash', 'UserService'
  ($scope,$routeParams,$location,$resource,flash,UserService)->
    # User = $resource('/users/:userId', {userId: '@id', format: 'json'})
    
    UserService.getUser().then (response) -> $scope.user = response.data
    $scope.viewTrips =-> $location.path("/trips")
    $scope.newTrip = -> $location.path("/trips/new")
    $scope.fish = -> $location.path("/fish")
])