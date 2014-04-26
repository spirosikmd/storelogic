'use strict'

describe 'Controller: EventListCtrl', () ->

  # load the controller's module
  beforeEach module 'storelogicApp'

  EventListCtrl = {}
  scope = {}
  eventListData = {}
  $q = {}

  createController = ->
    EventListCtrl 'EventListCtrl',
      $scope: scope
      api: eventListData

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, _$q_, EventListData) ->
    scope = $rootScope.$new()
    EventListCtrl = $controller
    $q = _$q_
    eventListData = EventListData

  beforeEach ->
    eventListData.getEvents = jasmine.createSpy('events')
    getEventsDefer = $q.defer()
    getEventsDefer.resolve()
    eventListData.getEvents.andReturn(getEventsDefer.promise)

  it 'should call eventListData.getEvents', () ->
    createController()
    scope.$digest()
    expect(eventListData.getEvents()).toHaveBeenCalled()
