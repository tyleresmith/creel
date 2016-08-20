

controllers = angular.module('controllers')
controllers.controller("FishController", [ '$scope', '$routeParams', '$location', '$resource'
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Fish = $resource('/fish/:fishId', { fishId: "@id", format: 'json' })
    
    if $routeParams.keywords
        Fish.query(keywords: $routeParams.keywords, (results)-> $scope.fishes = results)
    else
        $scope.fishes = []
])