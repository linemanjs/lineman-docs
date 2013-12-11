root = this

root.tapEventType = ->
  return 'touchstart' if 'ontouchstart' of document.documentElement
  'click'
