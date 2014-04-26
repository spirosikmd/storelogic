'use strict'

angular.module('storelogicApp')
  .factory 'Event', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'events', {}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          'Authorization': 'Basic ' + apiToken
        }
      }
    }
