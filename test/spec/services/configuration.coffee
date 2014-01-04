'use strict'

describe 'Service: Credentials', () ->

  # load the service's module
  beforeEach module 'PaylogicstoreApp'

  # instantiate service
  Credentials = {}
  beforeEach inject (_Credentials_) ->
    Credentials = _Credentials_

  it 'should do something', () ->
    expect(!!Credentials).toBe true
