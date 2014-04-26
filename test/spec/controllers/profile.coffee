'use strict'

describe 'Controller: ProfileCtrl', () ->

  # load the controller's module
  beforeEach module 'storelogicApp'

  ProfileCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ProfileCtrl = $controller 'ProfileCtrl', {
      $scope: scope
    }

  it 'should set a list of countries', () ->
    expect(scope.data.countries).toEqual ['NL', 'US']
