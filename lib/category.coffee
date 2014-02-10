_str = require('underscore.string')

module.exports = class Category
  constructor: (@pages, @slug) ->
    @title = _str.titleize(@slug.replace(/-/g, ' '))

  html: ->
    @pages
    .filter (page) =>
      page.attributes.category is @slug
    .sort (page1, page2) ->
      page1.attributes.ordinal - page2.attributes.ordinal
    .reduce (html, page) =>
      html + @pages.htmlFor({}, page)
    , ""

