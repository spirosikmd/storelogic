'use strict'

angular.module('paylogicStoreApp.services')
  .service 'Cache', ($angularCacheFactory) ->
    $angularCacheFactory 'cache', {
      maxAge: 900000,
      cacheFlushInterval: 3600000,
      deleteOnExpire: 'aggressive',
      storageMode: 'localStorage'
    }
