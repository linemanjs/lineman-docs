_str = require('underscore.string')

module.exports = class Category
  constructor: (@site, @slug) ->
    @title = _str.titleize(@slug.replace(/-/g, ' '))

  html: ->
    @site.pages
    .filter (page) =>
      page.attributes.category is @slug
    .sort (page1, page2) ->
      page1.attributes.ordinal - page2.attributes.ordinal
    .reduce (html, page) =>
      html + @site.pages.htmlFor(@site, page)
    , ""

