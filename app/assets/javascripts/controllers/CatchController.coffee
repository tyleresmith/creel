

controllers = angular.module('controllers')
controllers.controller("CatchController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
    Catch = $resource('/trips/'+$routeParams.tripId+'/catches/:catchId', { catchId: "@id", format: 'json' },
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
    
    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.catchModel.id
        $scope.catchModel.$save(
          ( ()-> $location.path("/trips/#{$scope.catchModel.trip.id}/catches/#{$scope.catchModel.id}") ),
          onError)
      else
        Catch.create($scope.catchModel,
          ( (newCatch)-> $location.path("/trips/#{$routeParams.tripId}/catches/") ),
          onError
        )
        
    $scope.back = (tripId) -> $location.path '/trips/' + $routeParams.tripId 
    $scope.edit = (catchId) -> $location.path("/trips/#{$routeParams.tripId}/catches/#{$routeParams.catchId}/edit")
    $scope.cancel = ->
      if $scope.trip.id
        $location.path("/trips/#{$scope.trip.id}")
      else
        $location.path("/trips")


])