(function(){
	'use strict';
	
	var serviceModule = angular.module('services');
	serviceModule.service('userService', function($resource, $cookies){
		var UserResource = $resource('/users.json',{
		});

		this.getAllUsers = function(){
			return UserResource.query();
		};

	});

}());