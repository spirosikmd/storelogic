'use strict'

app = angular.module 'paylogicStoreApp'

class ProfileCtrl
  @$inject = ["$scope", "Profile", "Cache"]

  constructor: (@scope, @Profile, @Cache) ->
    @scope.data = {}
    @scope.data.profileUri = @Cache.get 'profileUri'
    @scope.data.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate']
    @scope.data.format = @scope.data.formats[0]
    @scope.data.countries = ["NL", "US"]

    @Profile.get {uri__eq: @scope.data.profileUri}, (resource) =>
      @scope.data.profile = resource[0]
      @scope.data.profile.gender = switch
        when @scope.data.profile.gender is 1 then "male"
        when @scope.data.profile.gender is 2 then "female"

    angular.extend @scope,
      update: @update
      noProfile: @noProfile

  update: (profile) =>
    profile.gender = switch
      when profile.gender is "male" then 1
      when profile.gender is "female" then 2
    uid = @scope.data.profileUri.split('/')[4]
    revision = @scope.data.profileUri.split('/')[6]
    @Profile.update {profileUid:uid, profileRevision:revision}, profile, (response) =>
      @Cache.put 'profileUri', response.uri

  noProfile = =>
    not @Cache.get 'profileUri'

app.controller 'ProfileCtrl', ProfileCtrl
