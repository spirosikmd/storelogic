'use strict'

angular.module('paylogicStoreApp.services')
  .service 'EventListData', (Event) ->

    events = Event.get()

    {
      getEvents: ->
        events

      refreshEvents: ->
        Event.get()
    }
