
(function() {
  'use strict';

  angular
    .module('creel')
    .config(routerConfig)
    .factory("Fish", function(RailsResource) {
      var Fish;
      return Fish = (function(superClass) {
        extend(Fish, superClass);
    
        function fish() {
          return fish.__super__.constructor.apply(this, arguments);
        }
    
        fish.configure({
          url: "/api/fish",
          name: "fish"
        });
    
        return Fish;

      })(RailsResource);
    });

  /** @ngInject */
  function routerConfig($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'app/main/main.html',
        controller: 'MainController',
        controllerAs: 'main'
      })
      .state('fish', {
        url: "/fish",
        templateUrl: 'app/views/fish.html',
        controller: 'FishController',
        controllerAs: 'fish'
      });

    $urlRouterProvider.otherwise('/');
  }

})();
