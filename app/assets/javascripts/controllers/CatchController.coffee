

controllers = angular.module('controllers')
controllers.controller("CatchController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
      debugger;
    # Catch = $resource('/catches/:catchId', { catchId: "@id", format: 'json' },
    #   {
    #     'save': {method: 'PUT'},
    #     'create': {method: 'POST'}
    #   }
    # )
    # $scope.catch = Catch.query()
    # if $routeParams.tripId
    #   Trip.get({tripId: $routeParams.tripId},
    #     ( (trip)-> $scope.trip = trip),
    #     ( (httpResponse)-> 
    #       $scope.trip = null
    #       flash.error = "There is no trip with ID #{$routeParams.tripId}"
    #     )
    #   )
    # else
    #   $scope.trip = {}
        
    # $scope.back = (tripId) -> $location.path '/trips/' + tripId
    # # $scope.edit = (tripId) -> $location.path("/trips/#{tripId}/edit")
    # $scope.cancel = ->
    #   if $scope.trip.id
    #     $location.path("/trips/#{$scope.trip.id}")
    #   else
    #     $location.path("/trips")


])