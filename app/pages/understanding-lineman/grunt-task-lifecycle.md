---
title: "How does Lineman work?"
category: "understanding-lineman"
slug: "task-lifecycle"
ordinal: 4
---

#### Task Lifecycle

Lineman provides a small abstraction layer around Grunts task automation features. Lineman comes with a number of [default tasks](https://github.com/testdouble/lineman/blob/master/config/application.coffee#L11...L14) that have been pre-configured. These tasks are organized into buckets that make up the core lifecycle of Lineman as it acts in development and production:

```coffeescript
appTasks:
  common: ["coffee", "less", "jshint", "handlebars", "jst", "concat", "images:dev", "webfonts:dev", "pages:dev"]
  dev:    ["server", "watch"]
  dist:   ["uglify", "cssmin", "images:dist", "webfonts:dist", "pages:dist"]
```

#### Task Configuration

Grunt tasks are configured using _targets_ that define two critical pieces of information:

1. what _options_ a task will use
2. what _files_ a task will operate on

Lineman splits each of these concerns into two separate files:

1. `<your-application>/config/application{.js,.coffee}`
2. `<your-application>/config/files{.js,.coffee}`

Lineman allows you to override both its [default task options](https://github.com/testdouble/lineman/blob/master/config/application.coffee) and [default file locations](https://github.com/testdouble/lineman/blob/master/config/files.coffee) within your apps configuration.

```javascript
// <your-application>/config/application.js

module.exports = require(process.env['LINEMAN_MAIN']).config.extend('application', {
  //Override application configuration here. Common examples follow in the comments.
});
```

```javascript
// <your-application/config/files.js

module.exports = require(process.env['LINEMAN_MAIN']).config.extend('files', {
  //Override file patterns here
});
```

#### Which Configuration Wins?

Given that Lineman intentionally splits task configuration between multiple locations you may be wondering the order in which configuration files are merged:

1. `<your-project>/config/application{.js,.coffee}`
2. `<your-project>/node_modules/lineman/config/application.coffee`
3. `/usr/local/lib/node_modules/lineman/config/application.coffee` **

** If Lineman is not installed locally it will pull configuration from the global installation of Lineman
