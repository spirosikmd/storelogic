'use strict'

angular.module('paylogicStoreApp.controllers')
  .controller 'EventCtrl', ($scope, $routeParams, currencies, Cache, Event, Product, Basket, Ticket, BasketData) ->

    $scope.currencies = currencies
    $scope.products = []
    $scope.units = {}
    $scope.basket = BasketData.getBasket()
    $scope.profileUri = Cache.get('profileUri')

    Event.get {uri__eq: $routeParams.eventUri}, (resources) ->
      $scope.event = resources[0]

    Product.get {event__eq: $routeParams.eventUri}, (resources) ->
      for resource in resources
        $scope.products.push resource

    $scope.$on 'basketChanged', (event, basket) ->
      $scope.basket = basket

    $scope.$on 'ticketCanceled', ->
      refreshAvailability()

    refreshAvailability = ->
      Product.get {event__eq: $routeParams.eventUri}, (resources) ->
        $scope.products = []
        for resource in resources
          $scope.products.push resource

    buy = (productUri, units) ->
      data = []
      for _ in [1..units]
        data.push {
          "basket": $scope.basket.uri,
          "product": productUri
        }
      if data.length > 0
        if data.length == 1
          Ticket.buySingle data[0], (resource) ->
            BasketData.addTicket resource
            refreshAvailability()
        else
          Ticket.buyMultiple data, (resources) ->
            for resource in resources
              BasketData.addTicket resource
            refreshAvailability()

    $scope.buy = (productUri, units) ->
      if units > 0
        if BasketData.isEmpty()
          Basket.create (resource) ->
            BasketData.setBasket resource
            buy productUri, units
        else
          buy productUri, units

    $scope.isCompleted = ->
      $scope.basket?.state is 'completed'

    $scope.isCanceled = ->
      $scope.basket?.state is 'canceled'

    $scope.noProfile = ->
      not $scope.profileUri
