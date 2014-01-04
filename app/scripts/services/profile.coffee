'use strict'

angular.module('paylogicStoreApp.services')
  .factory 'Profile', ($resource, apiToken, baseUrl) ->
    $resource baseUrl + 'profiles', {}, {
      get: {
        method: 'GET',
        isArray: true,
        headers: {
          "Authorization": "Basic " + apiToken
        }
      }
      create: {
        method: "POST",
        headers: {
          "Authorization": "Basic " + apiToken,
          "Content-Type": "application/json"
        }
      }
      update: {
        method: "PUT",
        params: {
          profileUid: "@profileUid",
          profileRevision: "@profileRevision"
        },
        url: baseUrl + "profiles/:profileUid/revisions/:profileRevision",
        headers: {
          "Authorization": "Basic " + apiToken,
          "Content-Type": "application/json"
        }
      }
    }
