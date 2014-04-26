'use strict'

angular.module('storelogicApp')
  .service 'EventListData', (Event, Cache) ->

    events = Event.get()

    {
      getActiveEventUri: ->
        Cache.get 'eventUri'

      setActiveEventUri: (eventUri) ->
        Cache.put 'eventUri', eventUri

      getEvents: ->
        events

      refreshEvents: ->
        Event.get()
    }
