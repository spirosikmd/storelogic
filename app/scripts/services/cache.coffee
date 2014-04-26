'use strict'

angular.module('storelogicApp')
  .service 'Cache', ($angularCacheFactory) ->
    $angularCacheFactory 'cache', {
      maxAge: 9000000,
      cacheFlushInterval: 3600000,
      deleteOnExpire: 'aggressive',
      storageMode: 'localStorage'
    }
