# Exports an object that defines
#  all of the configuration needed by the projects'
#  depended-on grunt tasks.
#
# You can find the parent object in: node_modules/lineman/config/application.coffee
#

module.exports = require(process.env['LINEMAN_MAIN']).config.extend "application",

  loadNpmTasks: [ "grunt-markdown-blog", "grunt-html-validation", "grunt-htmlhint" ]

  enableSass: true
  enableAssetFingerprint: true

  # Use grunt-markdown-blog in lieu of Lineman's built-in pages task
  prependTasks:
    common: "markdown:dev"
    dist: "markdown:dist"

  markdown:
    options:
      author: "Test Double"
      title: "Lineman"
      description: "Build awesome web apps, easily."
      url: "http://www.linemanjs.com"
      layouts:
        wrapper: "app/templates/wrapper.us"
        index: "app/templates/index.us"
        page: "app/templates/page.us"
      paths:
        pages: "app/pages/**/*.md"
        index: "index.html"
      lib:
        Category: require('../lib/category')

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

  pages:
    dist:
      context:
        cdn: "http://cdn4.testdouble.com/"

  sass:
    options:
      bundleExec: true

  htmlhint:
    files:
      src: "generated/*.html"
    options:
      'tagname-lowercase': true, 'attr-lowercase': true, 'attr-value-double-quotes': true,
      'attr-value-not-empty': true, 'doctype-first': true, 'tag-pair': true, 'tag-self-close': true,
      'spec-char-escape': true, 'id-unique': true, 'src-not-empty': true, 'head-script-disabled': true,
      'img-alt-require': true, 'doctype-html5': true, 'id-class-value': true, 'style-disabled': true

  validation:
    files:
      src: "generated/*.html"
    options:
      relaxerror: [
        "Bad value X-UA-Compatible for attribute http-equiv on element meta."
        "Bad value source for attribute rel on element a: The string source is not a registered keyword or absolute URL."
      ]

  watch:
    markdown:
      files: ["app/posts/*.md", "app/templates/*.us", "app/pages/**/*.md" ]
      tasks: ["markdown:dev"]
