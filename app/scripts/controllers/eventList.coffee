'use strict'

app = angular.module 'paylogicStoreApp'

app.filter 'startFrom', ->
  (input, start) ->
    start = +start
    input.slice(start)

class EventListCtrl
  @$inject: ['$scope', 'Event', 'Location', 'Cache', 'EventListData']

  constructor: (@scope, @Event, @Location, @Cache, @EventListData) ->
    @scope.data = {}
    @scope.data.events = @EventListData.getEvents()
    @scope.data.locations = @Location.get()
    @scope.data.profileUri = @Cache.get 'profileUri'
    @scope.data.currentPage = 0
    @scope.data.pageSize = 5

    angular.extend @scope,
      getCity: @getCity
      getName: @getName
      getCountry: @getCountry
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
    @getLocation(locationUri)[0].city.en

  getName: (locationUri) =>
    @getLocation(locationUri)[0].name.en

  getCountry: (locationUri) =>
    @getLocation(locationUri)[0].country

  getLocation: (locationUri) =>
    location for location in @scope.data.locations when location.uri is locationUri

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

app.controller 'EventListCtrl', EventListCtrl
