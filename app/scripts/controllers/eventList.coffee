'use strict'

paylogicStoreAppControllers = angular.module 'paylogicStoreApp.controllers', [
  'paylogicStoreApp.services',
  'ui.bootstrap'
]

class EventListCtrl
  @$inject: ['$scope', 'Event', 'Location', 'Cache']

  constructor: (@scope, @Event, @Location, @Cache) ->
    @scope.data = {}
    @scope.data.events = @Event.get()
    @scope.data.locations = @Location.get()
    @scope.data.profileUri = @Cache.get('profileUri')

    angular.extend @scope,
      getCity: @getCity
      getLocation: @getLocation
      noProfile: @noProfile

  getCity: (locationUri) =>
    for location in @scope.data.locations
      if location.uri is locationUri
        city = location.city.en
        break
    city

  getLocation: (locationUri) =>
    for location in @scope.data.locations
      if location.uri is locationUri
        name = location.name.en
        break
    name

  noProfile: =>
    not @scope.data.profileUri

paylogicStoreAppControllers.controller 'EventListCtrl', EventListCtrl
