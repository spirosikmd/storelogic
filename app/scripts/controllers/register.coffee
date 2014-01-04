'use strict'

angular.module('paylogicStoreApp.controllers')
  .controller 'RegisterCtrl', ($scope, Profile, Cache) ->

    $scope.master = {}

    $scope.create = (user) ->
      user.gender = switch
        when user.gender is "male" then "1"
        when user.gender is "female" then "2"
      Profile.create user, (response) ->
        Cache.put 'profileUri', response.uri
        $scope.reset()

    $scope.reset = ->
      $scope.user = angular.copy $scope.master

    $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate'];
    $scope.format = $scope.formats[0];

    $scope.countries = [
      "NL",
      "US"
    ]

    $scope.reset()
