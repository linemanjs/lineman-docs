module.exports = require(process.env["LINEMAN_MAIN"]).config.extend "files",

  coffee:
    app: [
      "vendor/js/**/*.coffee",
      "app/js/**/*.coffee"
    ]

  js:
    vendor: [
      "vendor/js/jquery.js"
      "vendor/js/**/*.js"
    ]
