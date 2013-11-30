(function(){
	'use strict';
	
	var serviceModule = angular.module('services');
	serviceModule.service('userService', function($resource){
		var UserResource = $resource('/api/users.json');

		this.getAllUsers = function(){
			return UserResource.query();
		};

	});

}());