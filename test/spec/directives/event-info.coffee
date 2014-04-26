'use strict'

describe 'Directive: eventInfo', () ->

  # load the directive's module
  beforeEach module 'storelogicApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<event-info></event-info>'
    element = $compile(element) scope
    # expect(element.text()).toBe 'this is the eventInfo directive'
