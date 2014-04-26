'use strict'

angular.module('storelogicApp')
  .directive('copyright', () ->
    compile: (element) ->
      element.text 'Copyright 2014 | Storelogic'
  )
