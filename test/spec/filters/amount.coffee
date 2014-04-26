'use strict'

describe 'Filter: amount', () ->

  # load the filter's module
  beforeEach module 'storelogicApp'

  # initialize a new instance of the filter before each test
  amount = {}
  beforeEach inject ($filter) ->
    amount = $filter 'amount'

  it 'should return the input price as "€5.00 EUR"', () ->
    price = {
      'amount': '5.00',
      'currency': 'EUR'
    }
    expect(amount price).toBe ('€5.00 EUR')
