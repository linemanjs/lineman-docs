root = this

escapeKey = 27

root.Sidebar = class Sidebar
  init: ->
    $("<div></div>").sidr
      name: "sidr-right"
      side: "right"
      onOpen: -> enablePageLinks()
      onClose: -> disablePageLinks()

    $("#right-menu").on tapEventType(), =>
      @toggle()

    $(document).on 'keyup', (e) =>
      @close() if e.keyCode == escapeKey

    $(".close").on tapEventType(), =>
      @close()

    @

  toggle: ->
    @hasBeenOpened = true
    disablePageLinks()
    $.sidr("toggle", "sidr-right")

  close: ->
    $.sidr("close", "sidr-right")

disablePageLinks = ->
  $('nav .pages a').on 'click', (e) -> e.preventDefault()

enablePageLinks = ->
  $('nav .pages a').off('click')
