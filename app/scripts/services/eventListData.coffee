'use strict'

angular.module('storelogicApp')
  .service 'EventListData', (Event, Cache) ->

    activeEventUri = ''
    events = Event.get()

    {
      getActiveEventUri: ->
        activeEventUri or Cache.get 'eventUri'

      setActiveEventUri: (eventUri) ->
        activeEventUri = eventUri
        Cache.put 'eventUri', eventUri

      getEvents: ->
        events

      refreshEvents: ->
        Event.get()
    }
