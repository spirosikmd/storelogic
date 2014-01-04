'use strict'

angular.module('paylogicStoreApp')
  .controller 'EticketsCtrl', ($scope, Cache) ->

    $scope.profileUri = Cache.get('profileUri')
    $scope.eTicketsList = Cache.get('eTickets')
    $scope.eTicketLinks = []

    init = ->
      if $scope.eTicketsList
        for eTicket in $scope.eTicketsList
          if eTicket.profile is $scope.profileUri
            $scope.eTicketLinks.push(eTicket.eTicketLink)

    init()
