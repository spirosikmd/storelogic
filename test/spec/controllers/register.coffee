'use strict'

describe 'Controller: RegisterCtrl', () ->

  # load the controller's module
  beforeEach module 'paylogicStoreApp'

  RegisterCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RegisterCtrl = $controller 'RegisterCtrl', {
      $scope: scope
    }

  it 'should attach a list of date format to the scope', () ->
    expect(scope.data.formats.length).toBe 3
