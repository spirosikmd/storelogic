'use strict'

describe 'Service: Location', () ->

  # load the service's module
  beforeEach module 'PaylogicstoreApp'

  # instantiate service
  Location = {}
  beforeEach inject (_Location_) ->
    Location = _Location_

  it 'should do something', () ->
    expect(!!Location).toBe true
