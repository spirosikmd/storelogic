'use strict'

describe 'Service: apiToken', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  apiToken = {}
  beforeEach inject (_apiToken_) ->
    apiToken = _apiToken_

  it 'should do something', () ->
    expect(!!apiToken).toBe true
