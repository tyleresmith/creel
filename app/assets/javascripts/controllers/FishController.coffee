

controllers = angular.module('controllers')
controllers.controller("FishController", [ '$scope', '$routeParams', '$location', '$resource'
  ($scope,$routeParams,$location,$resource,flash)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Fish = $resource('/fish/:fishId', { fishId: "@id", format: 'json' })
    
    Fish.get({fishId: $routeParams.fishId},
      ( (fish)-> $scope.fish = fish),
      ( (httpResponse)-> 
        $scope.fish = null
        flash.error = "There is no fish with ID #{$routeParams.fishId}"
      )
    )
    
    if $routeParams.keywords
        Fish.query(keywords: $routeParams.keywords, (results)-> $scope.fishes = results)
    else
        $scope.fishes = []
        
    $scope.view = (fishId)-> $location.path("/fish/#{fishId}.json")
    
    $scope.back = -> $location.path("/")
])