module.exports = class Topic
  constructor: (page) ->
    @title = page.title()
    @slug = page.get('slug')
