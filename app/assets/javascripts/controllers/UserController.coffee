controllers = angular.module('controllers')
controllers.controller("UserController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->

    
        
    $scope.newTrip = -> $location.path("/trip/new")

])