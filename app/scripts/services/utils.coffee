'use strict'

app = angular.module('storelogicApp')

app.service 'Utils', () ->
  {
    uniqueId: (length=20) ->
      id = ""
      id += Math.random().toString(36).substr(2) while id.length < length
      id.substr 0, length
  }

app.constant 'currencies', {
  '': '',
  'EUR': '€',
  'USD': '$'
}

app.constant 'countries', ['NL', 'US']
