'use strict'

app = angular.module 'storelogicApp'

class RegisterCtrl
  @$inject = ["$scope", "Profile", "Cache", "countries"]

  constructor: (@scope, @Profile, @Cache, @countries) ->
    @scope.data = {}
    @scope.data.empty = {}
    @scope.data.formats = ["dd-MMMM-yyyy", "yyyy/MM/dd", "shortDate"]
    @scope.data.format = @scope.data.formats[0]
    @scope.data.countries = @countries

    angular.extend @scope,
      create: @create
      reset: @reset

    @scope.reset()

  create: (user) =>
    user.gender = switch
      when user.gender is "male" then "1"
      when user.gender is "female" then "2"
    @Profile.create user, (response) =>
      @Cache.put 'profileUri', response.uri
      @scope.reset()

  reset: =>
    @scope.data.user = angular.copy @scope.data.empty

app.controller 'RegisterCtrl', RegisterCtrl
