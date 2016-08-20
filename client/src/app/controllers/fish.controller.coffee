angular.module "creel"
  .controller "FishController", ($scope, Fish) ->
    Fish.query().then (fish) -> $scope.fish = fish