'use strict'

describe 'Controller: HistoryCtrl', () ->

  # load the controller's module
  beforeEach module 'paylogicStoreApp'

  EticketsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EticketsCtrl = $controller 'HistoryCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
