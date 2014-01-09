'use strict'

paylogicStoreAppControllers = angular.module('paylogicStoreApp')

class HistoryCtrl
  @$inject = ["$scope", "currencies", "Cache", "Basket", "Ticket"]

  constructor: (@scope, @currencies, @Cache, @Basket, @Ticket) ->
    @scope.data = {}
    @scope.data.profileUri = @Cache.get('profileUri')
    @scope.data.eTicketLinks = []
    @scope.data.baskets = []

    angular.extend @scope,
      init: @init
      linkExists: @linkExists

    @scope.init()

  init: =>
    if @scope.data.profileUri
      basketCounter = 0
      @Basket.get {profile__eq: @scope.data.profileUri}, (resources) =>
        for resource in resources
          basket = {
            name: "Basket " + basketCounter++,
            total: resource.total,
            state: resource.state,
            eticketsLink: resource.etickets
          }
          @scope.data.baskets.push basket

  linkExists: (link) ->
    link

  noProfile = =>
    not @scope.data.profileUri

paylogicStoreAppControllers.controller 'HistoryCtrl', HistoryCtrl
