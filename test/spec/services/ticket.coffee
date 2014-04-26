'use strict'

describe 'Service: Ticket', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  Ticket = {}
  beforeEach inject (_Ticket_) ->
    Ticket = _Ticket_

  it 'should do something', () ->
    expect(!!Ticket).toBe true
