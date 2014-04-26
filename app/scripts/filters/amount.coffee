'use strict'

angular.module('storelogicApp')
  .filter 'amount', (currencies) ->
    (input) ->
      currencies[input.currency] + input.amount + ' ' + input.currency
