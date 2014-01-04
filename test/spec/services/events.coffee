'use strict'

describe 'Service: Events', () ->

  # load the service's module
  beforeEach module 'PaylogicstoreApp'

  # instantiate service
  Events = {}
  beforeEach inject (_Events_) ->
    Events = _Events_

  it 'should do something', () ->
    expect(!!Events).toBe true
