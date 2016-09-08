function FishService($resource, $http) {
  this.favorite = function (fishId) {
    return $http.post('/fish/'+fishId+'/favorite')
  };
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