_str = require('underscore.string')
Topic = require('./topic')

module.exports = class Category
  constructor: (@site, @title) ->
    @slug = _str.slugify(@title)
    @pages = @site.pages
      .filter (page) =>
        page.attributes.category is @slug
      .sort (page1, page2) ->
        page1.attributes.ordinal - page2.attributes.ordinal
    @topics = @pages.map (page) -> new Topic(page)

  html: ->
    @pages.reduce (html, page) =>
      html + @site.pages.htmlFor(@site, page)
    , ""
