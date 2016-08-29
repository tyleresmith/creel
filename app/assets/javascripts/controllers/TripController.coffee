

controllers = angular.module('controllers')
controllers.controller("TripController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
    Trip = $resource('/trips/:tripId', { tripId: "@id", format: 'json' },
      {
        'save': {method: 'PUT'},
        'create': {method: 'POST'}
      }
    )
    $scope.trips = Trip.query()
    if $routeParams.tripId
      Trip.get({tripId: $routeParams.tripId},
        ( (trip)-> $scope.trip = trip),
        ( (httpResponse)-> 
          $scope.trip = null
          flash.error = "There is no trip with ID #{$routeParams.tripId}"
        )
      )
    else
      $scope.trip = {}
    
    $scope.home = -> $location.path("/")    
    $scope.viewTrip = (tripId) -> $location.path '/trips/' + tripId
    $scope.newTrip = -> $location.path("/trips/new")
    $scope.newCatch = (tripId) -> $location.path '/trips/' + tripId + '/catches/new'
    $scope.editCatch = (catchId) -> $location.path '/trips/' + $routeParams.tripId + '/catches/' + catchId + '/edit'
    $scope.viewCatch = (catchId) -> $location.path '/trips/' + $routeParams.tripId + '/catches/' + catchId  
    $scope.back = -> $location.path("/trips")
    $scope.edit = (tripId) -> $location.path("/trips/#{tripId}/edit")
    $scope.cancel = ->
      if $scope.trip.id
        $location.path("/trips/#{$scope.trip.id}")
      else
        $location.path("/trips")
        
    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      
      if $scope.trip.id
        $scope.trip.$save(
          ( ()-> $location.path("/trips/#{$scope.trip.id}") ),
          onError)
      else
        Trip.create($scope.trip,
          ( (newTrip)-> $location.path("/trips") ),
          onError
        )
        
    $scope.delete = ->
      $scope.trip.$delete()
      $scope.back()

])