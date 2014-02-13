cdn = "http://cdn4.testdouble.com/"
module.exports = require(process.env['LINEMAN_MAIN']).config.extend "application",

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
