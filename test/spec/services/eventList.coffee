'use strict'

describe 'Service: Event', () ->

  # load the service's module
  beforeEach module 'paylogicStoreApp'

  # instantiate service
  Event = {}
  beforeEach inject (_Event_) ->
    Event = _Event_

  it 'should do something', () ->
    expect(!!Event).toBe true
