'use strict'

angular.module('paylogicStoreApp')
  .factory 'Location', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'locations', {}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      }
    }
