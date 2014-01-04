'use strict'

angular.module('paylogicStoreApp.services', [
  'ngResource'
])
  .factory 'Event', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'events', {}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      }
    }
