'use strict'

describe 'Service: Cache', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  Cache = {}
  beforeEach inject (_Cache_) ->
    Cache = _Cache_

  it 'should do something', () ->
    expect(!!Cache).toBe true
