'use strict'

angular.module('storelogicApp')
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
