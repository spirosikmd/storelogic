'use strict'

describe 'Controller: RegisterCtrl', () ->

  # load the controller's module
  beforeEach module 'storelogicApp'

  RegisterCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RegisterCtrl = $controller 'RegisterCtrl', {
      $scope: scope
    }

  it 'should set a list of countries', () ->
    expect(scope.data.countries).toEqual ['NL', 'US']
