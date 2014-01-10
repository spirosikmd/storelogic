'use strict'

paylogicStoreAppControllers = angular.module 'paylogicStoreApp.controllers', [
  'paylogicStoreApp.services',
  'ui.bootstrap'
]

paylogicStoreAppControllers.filter 'startFrom', ->
  (input, start) ->
    start = +start
    input.slice(start);

class EventListCtrl
  @$inject: ['$scope', 'Event', 'Location', 'Cache', 'EventListData']

  constructor: (@scope, @Event, @Location, @Cache, @EventListData) ->
    @scope.data = {}
    @scope.data.events = @EventListData.getEvents()
    @scope.data.locations = @Location.get()
    @scope.data.profileUri = @Cache.get('profileUri')
    @scope.data.currentPage = 0;
    @scope.data.pageSize = 5;

    # @scope.$on 'eventsRefreshed', (events) =>
    #   @scope.data.events = []
    #   console.log events
    #   @scope.data.events = events

    angular.extend @scope,
      getCity: @getCity
      getLocation: @getLocation
      noProfile: @noProfile
      filter: @filter
      decreaseCurrentPage: @decreaseCurrentPage
      increaseCurrentPage: @increaseCurrentPage
      firstPage: @firstPage
      lastPage: @lastPage
      numberOfPages: @numberOfPages
      areEvents: @areEvents
      refreshEvents: @refreshEvents

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

  filter: =>
    if @scope.data.eventName
      console.log @scope.data.eventName
      @Event.get {title__startswith: @scope.data.eventName}, (resources) =>
        @scope.data.events = []
        @scope.data.events = resources
    else
      @scope.data.events = []
      @scope.data.events = @Event.get()

  numberOfPages: =>
    Math.ceil @scope.data.events.length / @scope.data.pageSize

  decreaseCurrentPage: =>
    @scope.data.currentPage -= 1

  increaseCurrentPage: =>
    @scope.data.currentPage += 1

  firstPage: =>
    @scope.data.currentPage == 0

  lastPage: =>
    @scope.data.currentPage + 1 == @numberOfPages()

  areEvents: =>
    @scope.data.events?.length > 0

  refreshEvents: =>
    @scope.data.events = []
    @scope.data.events = @EventListData.refreshEvents()

paylogicStoreAppControllers.controller 'EventListCtrl', EventListCtrl
