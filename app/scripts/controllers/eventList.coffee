'use strict'

angular.module('paylogicStoreApp.controllers', [
  'paylogicStoreApp.services',
  'ui.bootstrap'
])
  .controller 'EventListCtrl', ($scope, Event, Location, Cache) ->

    $scope.data = {}
    $scope.data.events = Event.get()
    $scope.data.locations = Location.get()
    $scope.profileUri = Cache.get('profileUri')

    $scope.getCity = (locationUri) ->
      for location in $scope.data.locations
        if location.uri is locationUri
          city = location.city.en
          break
      city

    $scope.getLocation = (locationUri) ->
      for location in $scope.data.locations
        if location.uri is locationUri
          name = location.name.en
          break
      name

    $scope.noProfile = ->
      not $scope.profileUri
