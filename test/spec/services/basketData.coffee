'use strict'

describe 'Service: Ticketlist', () ->

  # load the service's module
  beforeEach module 'PaylogicstoreApp'

  # instantiate service
  Ticketlist = {}
  beforeEach inject (_Ticketlist_) ->
    Ticketlist = _Ticketlist_

  it 'should do something', () ->
    expect(!!Ticketlist).toBe true
