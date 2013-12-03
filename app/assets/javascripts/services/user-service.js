(function(){
	'use strict';
	
	var serviceModule = angular.module('services');
	serviceModule.service('userService', function($resource, $cookies){
		var UserResource = $resource('/users',{},{
			responseType: 'json'
		});

		var UserLikesResource = $resource('/users/:user_id/user_likes',{
			user_id: '@user_id'
		},{
			responseType: 'json'
		});

		this.getAllUsers = function(){
			return UserResource.query();
		};

		this.likeUser = function(user){
			return new UserLikesResource.save({},{user_id: user.id});
		};

	});

}());