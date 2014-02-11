_str = require('underscore.string')

module.exports = class Topic
  constructor: (page) ->
    @title = page.title()
    @slug = page.get('slug') || _str.slugify(@title)
