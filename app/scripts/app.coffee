'use strict'

angular.module('paylogicStoreApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngResource',
  'ui.bootstrap',
  'jmdobry.angular-cache'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/eventList.html'
        controller: 'EventListCtrl'
      .when '/event/',
        templateUrl: 'views/event.html'
        controller: 'EventCtrl'
      .when '/profile/',
        templateUrl: 'views/profile.html'
        controller: 'ProfileCtrl'
      .when '/register/',
        templateUrl: 'views/register.html'
        controller: 'RegisterCtrl'
      .when '/history/',
        templateUrl: 'views/history.html'
        controller: 'HistoryCtrl'
      .otherwise
        redirectTo: '/'
