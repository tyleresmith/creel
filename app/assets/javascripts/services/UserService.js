function UserService($http) {
	this.getUser = function () {
		return $http.get('https://creel-tysmith.c9users.io/users.json', {userId: '@id', format: 'json'});
	};

}

angular
	.module('creel')
	.service('UserService', UserService);