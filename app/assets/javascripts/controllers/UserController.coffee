controllers = angular.module('controllers')
controllers.controller("UserController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
    User = $resource('/users/:userId', {userId: '@id', format: 'json'})
    
    $scope.user = User.get()
    $scope.viewTrips =-> $location.path("/trips")
    $scope.newTrip = -> $location.path("/trips/new")

])