---
title: "Using Sass (with libsass)"
category: "advanced-features"
slug: "using-libsass"
ordinal: 5
---

Lineman makes it really easy to use libsass instead of its built-in ruby sass support.

Just `npm i --save-dev grunt-sass` and then in `config/application.js`:

```
module.exports = (lineman) ->
  app = lineman.config.application;

  return {
    loadNpmTasks: app.loadNpmTasks.concat("grunt-sass"),

    prependTasks: {
      common: app.prependTasks.common.concat("sass")
    }
  };
```
