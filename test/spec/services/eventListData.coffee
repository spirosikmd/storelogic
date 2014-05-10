'use strict'

describe 'Service: EventListData', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  EventListData = {}
  httpBackend = {}
  rootScope = {}
  beforeEach inject (_EventListData_, $httpBackend, $rootScope, _baseUrl_) ->
    EventListData = _EventListData_
    httpBackend = $httpBackend
    rootScope = $rootScope
    baseUrl = _baseUrl_

  it 'should initiate the http call', () ->
    httpBackend.expectGET(baseUrl + '/events')
      .respond [{
        'title': {
          'en': 'Placed Event'
        }
      }]

    result = EventListData.getEvents()

    if !rootScope.$$phase
      rootScope.$apply()

    httpBackend.flush()

    expect(result[0].title.en).toBe('Placed Event')
