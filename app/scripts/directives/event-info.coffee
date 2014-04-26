'use strict'

angular.module('storelogicApp')
  .directive('eventInfo', () ->
    restrict: 'E',
    replace: true,
    templateUrl: 'views/eventInfo.html',
    transclude: true,
    scope: {
      startDate: '=',
      endDate: '='
    },
    link: (scope, element) ->
      infoButton = element.children()[0].children[0].children[0]
      scope.open = false
      angular.element(infoButton).bind('click', ->
        scope.$apply('open = !open')
      )
  )
