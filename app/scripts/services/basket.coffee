'use strict'

angular.module('paylogicStoreApp.services')
  .factory 'Basket', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'baskets/:basketUid', {basketUid:"@basketUid"}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      },
      create: {
        method: 'POST',
        headers: {
          "Authorization": "Basic " + apiToken,
          "Content-Type": "application/json"
        }
      },
      confirm: {
        method: "POST",
        params: {
          basketUid: "@basketUid"
        }
        url: baseUrl + "baskets/:basketUid/confirm",
        headers: {
          "Authorization": "Basic " + apiToken,
        }
      },
      cancel: {
        method: "POST",
        params: {
          basketUid: "@basketUid"
        }
        url: baseUrl + "baskets/:basketUid/cancel",
        headers: {
          "Authorization": "Basic " + apiToken,
        }
      }
    }
