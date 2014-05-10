'use strict'

describe 'Service: Basket', () ->

  # load the service's module
  beforeEach module 'storelogicApp'

  # instantiate service
  Basket = {}
  $httpBackend = {}
  $rootScope = {}
  beforeEach inject (_Basket_, _$httpBackend_, _$rootScope_, _baseUrl_) ->
    Basket = _Basket_
    $httpBackend = _$httpBackend_
    $rootScope = _$rootScope_
    baseUrl = _baseUrl_

  describe 'getBasket', ->
    it 'should get a basket given a basket_uid', ->
      $httpBackend.expectGET(baseUrl + '/baskets/b4e7d795101f4b8382870200eab6e0de')
        .respond [{
          'etickets': baseUrl + '/eticket/0Jz9NXrnWBpcFA97VLDvIgRmL6QYcUfhZbr3InmO',
          'state': 'completed',
          'tickets': [
            baseUrl + '/tickets/93ecd46432334369bc750aa0c78e510a'
          ],
          'total': {
            'amount': '5.00',
            'currency': 'EUR'
          },
          'uri': baseUrl + '/baskets/b4e7d795101f4b8382870200eab6e0de'
        }]

      result = Basket.get({basketUid: 'b4e7d795101f4b8382870200eab6e0de'})

      if !$rootScope.$$phase
        $rootScope.$apply()

      $httpBackend.flush()

      expect(result[0].etickets).toEqual(baseUrl + '/eticket/0Jz9NXrnWBpcFA97VLDvIgRmL6QYcUfhZbr3InmO')
      expect(result[0].state).toEqual('completed')
      expect(result[0].tickets[0]).toEqual(baseUrl + '/tickets/93ecd46432334369bc750aa0c78e510a')
      expect(result[0].total.amount).toEqual('5.00')
      expect(result[0].total.currency).toEqual('EUR')
      expect(result[0].uri).toEqual(baseUrl + '/baskets/b4e7d795101f4b8382870200eab6e0de')

  describe 'createBasket', ->
    it 'should create a basket and return a state and a uri', ->
      $httpBackend.expectPOST(baseUrl + '/baskets')
        .respond [{
          'state': 'creating',
          'uri': baseUrl + '/baskets/b4e7d795101f4b8382870200eab6e0de'
        }]

      result = Basket.create()

      if !$rootScope.$$phase
        $rootScope.$apply()

      $httpBackend.flush()

      expect(result[0].state).toEqual('creating')
      expect(result[0].uri).toEqual(baseUrl + '/baskets/b4e7d795101f4b8382870200eab6e0de')
