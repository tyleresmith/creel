function FishService($resource) {
  return $resource('/fish/:fishId', {
    fishId: "@id",
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
	.service('FishService', FishService);