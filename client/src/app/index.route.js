(function() {
  'use strict';

  angular
    .module('creel')
    .config(routerConfig);

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
        templateUrl: 'app/views/fish.jade',
        controller: 'FishController',
        controllerAs: 'fish'
      });

    $urlRouterProvider.otherwise('/');
  }

})();
