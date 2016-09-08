function FishFavoriteService($http) {
    this.favorite = function (fishId) {
        return $http.get('/fish/'+fishId+'/favorite')
    }
};


angular
	.module('creel')
	.service('FishFavoriteService', FishFavoriteService);