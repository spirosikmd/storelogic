'use strict'

app = angular.module 'storelogicApp'

class EventCtrl
  @$inject = ["$scope", "$routeParams", "currencies", "Cache", "Event", "Product", "Basket", "Ticket", "BasketData", "EventListData"]

  constructor: (@scope, @routeParams, @currencies, @Cache, @Event, @Product, @Basket, @Ticket, @BasketData, @EventListData) ->
    @scope.data = {}
    @scope.data.empty = {}
    @scope.data.currencies = @currencies
    @scope.data.products = []
    @scope.data.units = {}
    @scope.data.basket = @BasketData.getBasket()
    @scope.data.profileUri = @Cache.get 'profileUri'

    @Event.get {uri__eq: @EventListData.getActiveEventUri()}, (resources) =>
      @scope.data.event = resources[0]

    @Product.get {event__eq: @EventListData.getActiveEventUri()}, (resources) =>
      for resource in resources
        @scope.data.products.push resource

    @scope.$on 'basketChanged', (event, basket) =>
      @scope.data.basket = basket

    @scope.$on 'ticketCanceled', =>
      @refreshAvailability()

    angular.extend @scope,
      refreshAvailability: @refreshAvailability
      add: @add
      isCompleted: @isCompleted
      isCanceled: @isCanceled
      noProfile: @noProfile

  refreshAvailability: =>
    @Product.get {event__eq: @routeParams.eventUri}, (resources) =>
      @scope.data.products = []
      for resource in resources
        @scope.data.products.push resource

  _add: =>
    data = []
    for productUri, units of @scope.data.units
      if units > 0
        for _ in [1..units]
          data.push {
            "basket": @scope.data.basket.uri,
            "product": productUri
          }
    @scope.data.units = angular.copy @scope.data.empty
    if data.length > 0
      if data.length == 1
        @Ticket.buySingle data[0], (resource) =>
          @BasketData.addTicket resource
          @refreshAvailability()
      else
        @Ticket.buyMultiple data, (resources) =>
          for resource in resources
            @BasketData.addTicket resource
          @refreshAvailability()

  add: =>
    if @scope.data.units
      if @BasketData.isEmpty()
        data = {
          "profile": @Cache.get 'profileUri'
        }
        @Basket.create data, (resource) =>
          @BasketData.setBasket resource
          @_add()
      else
        @_add()

  isCompleted = =>
    @scope.data.basket?.state is 'completed'

  isCanceled = =>
    @scope.data.basket?.state is 'canceled'

  noProfile = =>
    not @scope.data.profileUri

app.controller 'EventCtrl', EventCtrl
