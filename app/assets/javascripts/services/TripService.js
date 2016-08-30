function TripService($resource,$routeParams) {
    return $resource('/trips/:tripId', {
      tripId: "@id",
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
	.service('TripService', TripService);