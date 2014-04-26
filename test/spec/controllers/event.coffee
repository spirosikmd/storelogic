'use strict'

describe 'Controller: EventCtrl', () ->

  # load the controller's module
  beforeEach module 'storelogicApp'

  EventCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EventCtrl = $controller 'EventCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    # expect(scope.awesomeThings.length).toBe 3
