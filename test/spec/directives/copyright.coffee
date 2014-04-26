'use strict'

describe 'Directive: copyright', () ->

  # load the directive's module
  beforeEach module 'storelogicApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<div copyright></div>'
    element = $compile(element) scope
    expect(element.text()).toBe 'Copyright 2014 | Storelogic'
