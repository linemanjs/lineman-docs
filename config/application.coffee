# Exports an object that defines
#  all of the configuration needed by the projects'
#  depended-on grunt tasks.
#
# You can find the parent object in: node_modules/lineman/config/application.coffee
#

module.exports = require(process.env['LINEMAN_MAIN']).config.extend "application",

  loadNpmTasks: ["grunt-markdown-blog"]

  markdown:
    options:
      author: "Test Double"
      title: "Lineman"
      description: "Build awesome web apps, easily."
      url: "http://www.linemanjs.com"
      layouts:
        wrapper: "app/templates/wrapper.us"
        index: "app/templates/index.us"
        post: "app/templates/post.us"
        archive: "app/templates/archive.us"
        page: "app/templates/page.us"
      paths:
        posts: "app/posts/*.md"
        pages: "app/pages/**/*.md"
        index: "index.html"
        archive: "archive.html"
        rss: "index.xml"

    dev:
      dest: "generated"
      context:
        cdn: ""
        js: "../js/app.js"
        css: "../css/app.css"

    dist:
      dest: "dist"
      context:
        cdn: "http://cdn4.testdouble.com/"
        js: "../js/app.js"
        css: "../css/app.css"

  # Use grunt-markdown-blog in lieu of Lineman's built-in pages task
  prependTasks:
    common: "markdown:dev"
    dist: "markdown:dist"

  enableSass: true
  enableAssetFingerprint: true

  watch:
    markdown:
      files: ["app/posts/*.md", "app/templates/*.us", "app/pages/**/*.md" ]
      tasks: ["markdown:dev"]
