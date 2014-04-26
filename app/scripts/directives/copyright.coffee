'use strict'

angular.module('storelogicApp')
  .directive('copyright', () ->
    compile: (element) ->
      element.text '© 2014 Storelogic'
  )
