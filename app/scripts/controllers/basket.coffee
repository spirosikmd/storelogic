'use strict'

app = angular.module 'storelogicApp'

class BasketCtrl
  @$inject = ["$rootScope", "$scope", "currencies", "Basket", "Ticket", "Product", "Cache", "BasketData"]

  constructor: (@rootScope, @scope, @currencies, @Basket, @Ticket, @Product, @Cache, @BasketData) ->
    @scope.data = {}
    @scope.data.currencies = @currencies
    @scope.data.tickets = @BasketData.getTickets()
    @scope.data.basket = @BasketData.getBasket()
    @scope.data.total = @BasketData.getTotal()

    @scope.$on 'basketChanged', (event, basket) =>
      @scope.data.basket = basket

    @scope.$on 'ticketsRefreshed', (event, tickets) =>
      @scope.data.tickets = tickets

    @scope.$on 'ticketAdded', (event, tickets) =>
      @scope.data.tickets = tickets

    @scope.$on 'ticketRemoved', (event, tickets) =>
      @scope.data.tickets = tickets

    @scope.$on 'totalChanged', (event, total) =>
      @scope.data.total = total

    angular.extend @scope,
      confirmBasket: @confirmBasket
      cancelBasket: @cancelBasket
      resetBasket: @resetBasket
      cancelTicket: @cancelTicket
      areTickets: @areTickets
      isCompleted: @isCompleted
      isCanceled: @isCanceled
      noBasket: @noBasket

  confirmBasket: =>
    uid = @scope.data.basket.uri.split('/')[4]
    @Basket.confirm {basketUid:uid}, (resource) =>
      @scope.data.basket.state = resource.state
      @scope.data.etickets = resource.etickets

  cancelBasket: =>
    uid = @scope.data.basket.uri.split('/')[4]
    @Basket.cancel {basketUid:uid}, (resource) =>
      @scope.data.basket.state = resource.state

  resetBasket: =>
    @Cache.remove 'basketUri'
    @BasketData.resetBasket()

  cancelTicket: (ticketUri) =>
    uid = ticketUri.split('/')[4]
    @Ticket.cancel {ticketUid:uid}, =>
      @BasketData.removeTicket ticketUri
      @rootScope.$broadcast 'ticketCanceled', ticketUri

  areTickets: =>
    @scope.data.tickets.length <= 0

  isCompleted: =>
    @scope.data.basket?.state is 'completed'

  isCanceled: =>
    @scope.data.basket?.state is 'canceled'

  noBasket: =>
    @BasketData.isEmpty()

app.controller 'BasketCtrl', BasketCtrl
