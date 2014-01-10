'use strict'

describe 'Controller: BasketCtrl', () ->

  # load the controller's module
  beforeEach module 'paylogicStoreApp'

  BasketCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BasketCtrl = $controller 'BasketCtrl', {
      $scope: scope
    }

  it 'should attach a list of tickets to the scope', () ->
    expect(scope.data.tickets.length).toBe 0
