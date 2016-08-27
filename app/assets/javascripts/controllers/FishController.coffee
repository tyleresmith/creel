

controllers = angular.module('controllers')
controllers.controller("FishController", [ '$scope', '$routeParams', '$location', '$resource', 'flash',
  ($scope,$routeParams,$location,$resource,flash)->
    $scope.search = (keywords)->  $location.path("/fish").search('keywords',keywords)
    Fish = $resource('/fish/:fishId', { fishId: "@id", format: 'json' },
      {
        'save': {method: 'PUT'},
        'create': {method: 'POST'}
      }
    )
    
    if $routeParams.fishId
      Fish.get({fishId: $routeParams.fishId},
        ( (fish)-> $scope.fish = fish),
        ( (httpResponse)-> 
          $scope.fish = null
          flash.error = "There is no fish with ID #{$routeParams.fishId}"
        )
      )
    else
      $scope.fish = {}
    
    if $routeParams.keywords
        Fish.query(keywords: $routeParams.keywords, (results)-> $scope.fishes = results)
    else
        $scope.fishes = []
    
    $scope.home = -> $location.path('/')    
    $scope.view = (fishId)-> $location.path("/fish/#{fishId}")
    $scope.newFish = -> $location.path("/fish/new")
    $scope.back = -> $location.path("/fish")
    $scope.edit = (fishId) -> $location.path("/fish/#{fishId}/edit")
    $scope.cancel = ->
      if $scope.fish.id
        $location.path("/fish/#{$scope.fish.id}")
      else
        $location.path("/fish")
        
    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      
      if $scope.fish.id
        $scope.fish.$save(
          ( ()-> $location.path("/fish/#{$scope.fish.id}") ),
          onError)
      else
        Fish.create($scope.fish,
          ( (newFish)-> $location.path("/fish/#{newFish.id}") ),
          onError
        )
        
    $scope.delete = ->
      $scope.fish.$delete()
      $scope.back()

])