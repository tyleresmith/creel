

controllers = angular.module('controllers')
controllers.controller("CatchController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
    
    Catch = $resource('/catches/:catchId', { catchId: "@id", format: 'json' },
      {
        'save': {method: 'PUT'},
        'create': {method: 'POST'}
      }
    )


    # catchModel named to circumvent reexisting JS method 'catch'
    if $routeParams.catchId
      Catch.get({catchId: $routeParams.catchId},
        ( (catchModel)-> $scope.catchModel = catchModel),
        ( (httpResponse)-> 
          $scope.catchModel = null
          flash.error = "There is no catch with ID #{$routeParams.catchId}"
        )
      )
    else
      $scope.catchModel = {}
    

        
    $scope.back = (catchId) -> $location.path '/trips/' + $routeParams.tripId 
    # # $scope.edit = (tripId) -> $location.path("/trips/#{tripId}/edit")
    # $scope.cancel = ->
    #   if $scope.trip.id
    #     $location.path("/trips/#{$scope.trip.id}")
    #   else
    #     $location.path("/trips")


])