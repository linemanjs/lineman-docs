cdn = "http://cdn4.testdouble.com/"
lineman = require(process.env['LINEMAN_MAIN'])

module.exports = lineman.config.extend "application",

  loadNpmTasks: lineman.config.application.loadNpmTasks.concat [ "grunt-html-validation", "grunt-htmlhint" ]

  enableSass: true
  enableAssetFingerprint: true

  markdown:
    options:
      author: "Test Double"
      title: "Lineman"
      description: "Build awesome web apps, easily."
      url: "<%= pkg.homepage %>"
      paths:
        archive: null
        rss: null
      lib:
        Category: require('../lib/category')

    dev:
      context:
        cdn: ""

    dist:
      context:
        cdn: cdn

  pages:
    dist:
      context:
        cdn: cdn

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
