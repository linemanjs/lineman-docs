module.exports = require(process.env['LINEMAN_MAIN']).config.extend "application",

  enableSass: true
  enableAssetFingerprint: true

  markdown:
    options:
      author: "Test Double"
      title: "Lineman"
      description: "Build awesome web apps, easily."
      url: "http://www.linemanjs.com"
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
        cdn: "http://cdn4.testdouble.com/"

  pages:
    dist:
      context:
        cdn: "http://cdn4.testdouble.com/"

  sass:
    options:
      bundleExec: true
