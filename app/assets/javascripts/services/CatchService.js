function CatchService($resource,$routeParams) {
    return $resource('/trips/' + $routeParams.tripId + '/catches/:catchId', {
      catchId: "@id",
      format: 'json'
    }, {
      'save': {
        method: 'PUT'
      },
      'create': {
        method: 'POST'
      }
    });
};


angular
	.module('creel')
	.service('CatchService', CatchService);