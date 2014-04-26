'use strict'

describe 'Controller: OrdersCtrl', () ->

  # load the controller's module
  beforeEach module 'storelogicApp'

  EticketsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EticketsCtrl = $controller 'OrdersCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    # expect(scope.awesomeThings.length).toBe 3
