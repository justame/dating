(function() {
	'use strict';

	window.datingApp = angular.module('datingApp', ['ngResource', 'ui.router', 'directives', 'services', 'ngSanitize', 'ngCookies']);

	datingApp.config(function($httpProvider) {
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
		$httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
		$httpProvider.interceptors.push(function($cookies) {
			return {
				'request': function(config) {
					config.params = config.params || {};
					config.params.access_token = $cookies.access_token;
					config.params.uid = $cookies.user_id;
					return config;
				},
				'response': function(response) {
					return response;
				}
			};
		});
	});

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