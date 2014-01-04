'use strict'

angular.module('paylogicStoreApp.services')
  .factory 'Ticket', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'tickets/:ticketUid', {ticketUid:"@id"}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      },
      buyMultiple: {
        method: 'POST',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken,
          "Content-Type": "application/json"
        }
      },
      buySingle: {
        method: 'POST',
        headers: {
          "Authorization": "Basic " + apiToken,
          "Content-Type": "application/json"
        }
      }
      cancel: {
        method: 'DELETE',
        headers: {
          "Authorization": "Basic " + apiToken
        }
      }
    }
