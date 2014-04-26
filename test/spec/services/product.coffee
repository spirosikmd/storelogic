'use strict'

describe 'Service: Product', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  Product = {}
  beforeEach inject (_Product_) ->
    Product = _Product_

  it 'should do something', () ->
    expect(!!Product).toBe true
