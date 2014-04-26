'use strict'

app = angular.module 'storelogicApp'

class OrdersCtrl
  @$inject = ["$scope", "currencies", "Cache", "Basket", "Ticket", "Utils"]

  constructor: (@scope, @currencies, @Cache, @Basket, @Ticket, @Utils) ->
    @scope.data = {}
    @scope.data.profileUri = @Cache.get 'profileUri'
    @scope.data.eTicketLinks = []
    @scope.data.orders = []

    angular.extend @scope,
      init: @init
      noOrders: @noOrders
      linkExists: @linkExists
      noProfile: @noProfile

    @scope.init()

  init: =>
    if @scope.data.profileUri
      @Basket.get {profile__eq: @scope.data.profileUri}, (resources) =>
        for resource in resources
          order =
            id: @Utils.uniqueId()
            total: resource.total
            state: resource.state
            eticketsLink: resource.etickets
          @scope.data.orders.push order

  linkExists: (link) ->
    link

  noOrders: =>
    angular.equals @scope.data.orders, []

  noProfile: =>
    not @scope.data.profileUri


app.controller 'OrdersCtrl', OrdersCtrl
