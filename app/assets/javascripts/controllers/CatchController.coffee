

controllers = angular.module('controllers')
controllers.controller("CatchController", [ '$scope', '$routeParams', '$location', '$resource', 'flash','CatchService',
  ($scope,$routeParams,$location,$resource,flash,CatchService)->


    # catchModel named to circumvent reexisting JS method 'catch'
    if $routeParams.catchId
      CatchService.get({catchId: $routeParams.catchId},
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
        CatchService.create($scope.catchModel,
          ( (newCatch)-> $location.path("/trips/#{$routeParams.tripId}") ),
          onError
        )
    
    $scope.trips = (fishId) -> $location.path("/fish/#{fishId}/trips")
    $scope.back = (tripId) -> $location.path '/trips/' + $routeParams.tripId 
    $scope.edit = (catchId) -> $location.path("/trips/#{$routeParams.tripId}/catches/#{$routeParams.catchId}/edit")
    $scope.cancel = ->
      if $routeParams.catchId
        $location.path("/trips/#{$routeParams.tripId}/catches/#{$routeParams.catchId}")
      else
        $location.path("/trips/#{$routeParams.tripId}")
    $scope.delete = ->
      $scope.catchModel.$delete()
      $scope.back()


])