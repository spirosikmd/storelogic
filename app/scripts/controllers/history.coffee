'use strict'

app = angular.module 'storelogicApp'

class HistoryCtrl
  @$inject = ["$scope", "currencies", "Cache", "Basket", "Ticket"]

  constructor: (@scope, @currencies, @Cache, @Basket, @Ticket) ->
    @scope.data = {}
    @scope.data.profileUri = @Cache.get 'profileUri'
    @scope.data.eTicketLinks = []
    @scope.data.baskets = []

    angular.extend @scope,
      init: @init
      noHistory: @noHistory
      linkExists: @linkExists
      noProfile: @noProfile

    @scope.init()

  init: =>
    if @scope.data.profileUri
      basketCounter = 1
      @Basket.get {profile__eq: @scope.data.profileUri}, (resources) =>
        for resource in resources
          basket =
            name: "Basket " + basketCounter++
            total: resource.total
            state: resource.state
            eticketsLink: resource.etickets
          @scope.data.baskets.push basket

  linkExists: (link) ->
    link

  noHistory: =>
    angular.equals @scope.data.baskets, []

  noProfile: =>
    not @scope.data.profileUri


app.controller 'HistoryCtrl', HistoryCtrl
