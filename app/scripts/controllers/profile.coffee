'use strict'

angular.module('paylogicStoreApp.controllers')
  .controller 'ProfileCtrl', ($scope, Profile, Cache) ->

    $scope.profileUri = Cache.get 'profileUri'
    Profile.get {uri__eq: $scope.profileUri}, (resource) ->
      $scope.profile = resource[0]
      $scope.profile.gender = switch
        when $scope.profile.gender is 1 then "male"
        when $scope.profile.gender is 2 then "female"

    $scope.update = (profile) ->
      profile.gender = switch
        when profile.gender is "male" then 1
        when profile.gender is "female" then 2
      uid = $scope.profileUri.split('/')[4]
      revision = $scope.profileUri.split('/')[6]
      Profile.update {profileUid:uid, profileRevision:revision}, profile, (response) ->
        Cache.put('profileUri', response.uri);

    $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate'];
    $scope.format = $scope.formats[0];

    $scope.countries = [
      "NL",
      "US"
    ]

    $scope.noProfile = ->
      not Cache.get 'profileUri'
