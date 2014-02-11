_str = require('underscore.string')
Topic = require('./topic')

module.exports = class Category
  constructor: (@site, @title) ->
    @slug = _str.slugify(@title)
    @pages = @site.pages
      .filter (page) =>
        page.get('category') is @slug
      .sort (page1, page2) ->
        page1.get('ordinal') - page2.get('ordinal')
    @topics = @pages.map (page) -> new Topic(page)

  html: ->
    @pages.reduce (html, page) =>
      html + @site.pages.htmlFor(@site, page)
    , ""
