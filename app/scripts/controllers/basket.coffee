'use strict'

angular.module('paylogicStoreApp.controllers')
  .controller 'BasketCtrl', ($rootScope, $scope, currencies, Basket, Ticket, Product, Cache, BasketData) ->

    $scope.currencies = currencies
    $scope.tickets = BasketData.getTickets()
    $scope.etickets = Cache.get 'eTickets'
    $scope.basket = BasketData.getBasket()
    $scope.total = BasketData.getTotal()

    $scope.$on 'basketChanged', (event, basket) ->
      $scope.basket = basket

    $scope.$on 'ticketsRefreshed', (event, tickets) ->
      $scope.tickets = tickets

    $scope.$on 'ticketAdded', (event, tickets) ->
      $scope.tickets = tickets

    $scope.$on 'ticketRemoved', (event, tickets) ->
      $scope.tickets = tickets

    $scope.$on 'totalChanged', (event, total) ->
      $scope.total = total

    $scope.confirmBasket = ->
      uid = $scope.basket.uri.split('/')[4]
      Basket.confirm {basketUid:uid}, (resource) ->
        $scope.basket.state = resource.state
        $scope.etickets = resource.etickets
        eticketsList = Cache.get('eTickets') ? []
        data = {
          'profile': Cache.get('profileUri'),
          'eTicketLink': resource.etickets
        }
        eticketsList.push data
        Cache.put 'eTickets', eticketsList

    $scope.cancelBasket = ->
      uid = $scope.basket.uri.split('/')[4]
      Basket.cancel {basketUid:uid}, (resource) ->
        $scope.basket.state = resource.state

    $scope.resetBasket = ->
      Cache.remove 'basketUri'
      BasketData.resetBasket()

    $scope.cancelTicket = (ticketUri) ->
      uid = ticketUri.split('/')[4]
      Ticket.cancel {ticketUid:uid}, ->
        BasketData.removeTicket ticketUri
        $rootScope.$broadcast 'ticketCanceled', ticketUri

    $scope.areTickets = ->
      $scope.tickets.length <= 0

    $scope.isCompleted = ->
      $scope.basket?.state is 'completed'

    $scope.isCanceled = ->
      $scope.basket?.state is 'canceled'

    $scope.noBasket = ->
      BasketData.isEmpty()
