'use strict'

angular.module('paylogicStoreApp.services')
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
