(function(){
	'use strict';
	datingApp.controller('MainCtrl', function($scope, userService){
		$scope.users = userService.getAllUsers();
	});

}());