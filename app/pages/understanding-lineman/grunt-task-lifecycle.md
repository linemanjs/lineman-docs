---
title: "How does Lineman work?"
category: "understanding-lineman"
slug: "task-lifecycle"
ordinal: 4
---

#### Task Lifecycle

Lineman is a thin abstraction layer on top of Grunt's task automation features. Lineman comes with a number of [default tasks](https://github.com/linemanjs/lineman/blob/f13bde48c639569be3d50ec148e2c0e018d66ba0/config/application.coffee#L11...L14) that have been pre-configured. These tasks are organized into lifecycle phases that identify at which point during the build each task should run. Those phases can be illustrated as a set of ordered tasks, like this:

```coffeescript
appTasks:
  common: ["coffee", "less", "jshint", "handlebars", "jst", "concat", "images:dev", "webfonts:dev", "pages:dev"]
  dev:    ["server", "watch"]
  dist:   ["uglify", "cssmin", "images:dist", "webfonts:dist", "pages:dist"]
```

The "common" phase is run during most Lineman actions (e.g. during both `lineman run` & `lineman build`). The "dev" phase only runs during development tasks (e.g. `lineman run`). The "dist" phase only runs during production ("distribution") tasks (e.g. `lineman build`).

#### Task Configuration

Grunt tasks are configured using _targets_ that define two critical pieces of information:

1. what _options_ a task will use
2. what _files_ a task will operate on

Lineman splits each of these concerns into two separate files:

1. `<your-application>/config/application{.js,.coffee}`
2. `<your-application>/config/files{.js,.coffee}`

Lineman allows you to override both its [default task _options_](https://github.com/linemanjs/lineman/blob/master/config/application.coffee) and [default _file_ locations](https://github.com/linemanjs/lineman/blob/master/config/files.coffee) within your apps configuration.

```javascript
// <your-application>/config/application.js

module.exports = function(lineman) {
  //Override application configuration here
  return {};
};

```

And:

```javascript
// <your-application/config/files.js

module.exports = function(lineman) {
  //Override file patterns here
  return {};
};
```

#### Which Configuration Wins?

Given that Lineman intentionally splits task configuration between multiple locations you may be wondering the order in which configuration files are merged:

1. `<your-project>/config/application{.js,.coffee}`
2. `<your-project>/node_modules/lineman/config/application.coffee`
3. `/usr/local/lib/node_modules/lineman/config/application.coffee` **

** If Lineman is not installed locally it will pull configuration from the global installation of Lineman
