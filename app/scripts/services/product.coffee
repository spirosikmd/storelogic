'use strict'

angular.module('storelogicApp')
  .factory 'Product', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'products', {}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      }
    }
