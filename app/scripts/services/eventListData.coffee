'use strict'

angular.module('paylogicStoreApp')
  .service 'EventListData', (Event) ->

    events = Event.get()

    {
      getEvents: ->
        events

      refreshEvents: ->
        Event.get()
    }
