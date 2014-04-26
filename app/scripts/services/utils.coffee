'use strict'

angular.module('storelogicApp')
  .service 'Utils', () ->
    {
      uniqueId: (length=20) ->
        id = ""
        id += Math.random().toString(36).substr(2) while id.length < length
        id.substr 0, length
    }
