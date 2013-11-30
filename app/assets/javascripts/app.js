(function() {
	'use strict';

	window.datingApp = angular.module('datingApp', ['ngResource', 'ui.router', 'directives', 'services']);
	
	datingApp.config([
	  "$httpProvider", function($httpProvider) {
	    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    	$httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';

	  }
	]);

	// directives
	angular.module('directives', []);
	
	// services
	angular.module('services', []);

	// routing
	datingApp.config(function($stateProvider, $urlRouterProvider) {

		// routing
		$urlRouterProvider.when('', '/users'); //root 

		// state
		$stateProvider
			.state('users', {
				url: "/users",
				controller: 'MainCtrl',
				templateUrl: "/assets/user/index.html"
			})
	});


}());