'use strict'

app = angular.module('storelogicApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.bootstrap',
  'jmdobry.angular-cache'
])

app.config ($routeProvider) ->
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
    .when '/orders/',
      templateUrl: 'views/orders.html'
      controller: 'OrdersCtrl'
    .otherwise
      redirectTo: '/'
