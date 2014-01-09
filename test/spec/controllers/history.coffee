'use strict'

describe 'Controller: EticketsCtrl', () ->

  # load the controller's module
  beforeEach module 'paylogicStoreApp'

  EticketsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EticketsCtrl = $controller 'EticketsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
