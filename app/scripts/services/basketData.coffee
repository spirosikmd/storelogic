'use strict'

angular.module('storelogicApp')
  .service 'BasketData', ($rootScope, Cache, Basket, Ticket, Product) ->

    basket = {}
    tickets = []
    total = {"amount": "0.00", "currency": ""}

    initTickets = (ticketUris) ->
      if ticketUris
        for ticketUri in ticketUris
          Ticket.get {uri__eq: ticketUri}, (resources) ->
            tickets.push resources[0]
        $rootScope.$broadcast 'ticketsRefreshed', tickets

    initTotal = (newValue) ->
      total = newValue ? {"amount": "0.00", "currency": ""}
      $rootScope.$broadcast 'totalChanged', total

    increaseTotal = (price) ->
      if price
        totalAmount = parseFloat total.amount
        totalAmount += parseFloat price.amount
        total.amount = totalAmount.toFixed 2
        total.currency = price.currency
        $rootScope.$broadcast 'totalChanged', total

    decreaseTotal = (price) ->
      if price
        totalAmount = parseFloat total.amount
        totalAmount -= parseFloat price.amount
        total.amount = totalAmount.toFixed 2
        total.currency = if totalAmount > 0 then price.currency else ""
        $rootScope.$broadcast 'totalChanged', total

    initData = (basketUri) ->
      Basket.get {uri__eq: basketUri}, (resources) ->
        basket = resources[0]
        $rootScope.$broadcast 'basketChanged', basket
        initTickets basket.tickets
        initTotal basket.total

    basketUri = Cache.get 'basketUri'
    if basketUri
      initData basketUri

    {
      addTicket: (ticket) ->
        tickets.push ticket
        $rootScope.$broadcast 'ticketAdded', tickets
        increaseTotal ticket.price

      removeTicket: (ticketUri) ->
        for ticket in tickets
          if ticket.uri is ticketUri
            index = tickets.indexOf ticket
            tickets.splice index, 1
            $rootScope.$broadcast 'ticketRemoved', tickets
            decreaseTotal ticket.price
            break

      getTickets: ->
        tickets

      setBasket: (resource) ->
        basket = resource
        Cache.put 'basketUri', basket.uri
        $rootScope.$broadcast 'basketChanged', basket

      getBasket: ->
        basket

      isEmpty: ->
        for k of basket
          return false
        true

      resetBasket: ->
        basket = {}
        $rootScope.$broadcast 'basketChanged', basket
        tickets = []
        $rootScope.$broadcast 'ticketsRefreshed', tickets
        total = {"amount": "0.00", "currency": ""}
        $rootScope.$broadcast 'totalChanged', total

      getTotal: ->
        total
    }
