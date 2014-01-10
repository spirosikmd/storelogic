'use strict'

describe 'Service: BasketData', () ->

  # load the service's module
  beforeEach module 'paylogicStoreApp'

  # instantiate service
  BasketData = {}
  beforeEach inject (_BasketData_) ->
    BasketData = _BasketData_

  it 'should do something', () ->
    expect(!!BasketData).toBe true
