(function() {
	directiveModule = angular.module('directives');

	directiveModule.directive('userThumbnail', function() {
		return {
			restrict: 'E',
			scope: {
				user: '='
			},
			replace:true,
			templateUrl: '/assets/shared/user_thumbnail.html',
			controller: function($scope) {
			}
		};
	});

}());