'use strict'

describe 'Service: Profile', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  Profile = {}
  beforeEach inject (_Profile_) ->
    Profile = _Profile_

  it 'should do something', () ->
    expect(!!Profile).toBe true
