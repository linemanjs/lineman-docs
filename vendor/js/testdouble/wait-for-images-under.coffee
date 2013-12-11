root = this

root.waitForImagesUnder = (selector, action = ->) ->
  $(selector).waitForImages(action, undefined, true)
