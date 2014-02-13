---
title: "Configuring Lineman"
category: "customizing-lineman"
slug: "configuring-lineman"
ordinal: 1
---

Every lineman project comes with a handful of minimal configuration files out of the box. These are:

``` bash
config/
├── application.js
├── files.js
├── lineman.js
├── server.js
└── spec.json
```

Any of the four JavaScript files can be changed to a CoffeeScript file, so if you prefer CoffeeScript we encourage you to first convert the file you're editing to CoffeeScript and to save it with a ".coffee" extension.

#### lineman config

Before we begin, let's look at a handy tool in our toolbox, the **lineman config** command.

At any time, you can ask Lineman what its configuration will look like as it will be passed to grunt (that is, after any plugin overrides or user overrides you've defined). To see the entire (very large) configuration object, just run:

``` bash
$ lineman config
```

Which is a handy way to scan and search for the option(s) you're interested in overriding. If you want to narrow your search, just provide `lineman config` the property path you're interested in. If you provide:

``` bash
$ lineman config jshint.options
```

You'll receive:

``` javascript
{
  "curly": true,
  "eqeqeq": true,
  "latedef": true,
  "newcap": true,
  "noarg": true,
  "boss": true,
  "eqnull": true,
  "sub": true,
  "browser": true
}
```

Note that this command can also be useful for script automation. For instance, the [lineman heroku buildpack](https://github.com/linemanjs/heroku-buildpack-lineman) checks to see if Sass is enabled in a bash script by invoking `lineman config enableSass` and relying on a plaintext response of "true" or "false"

Now, let's discuss each of these files, one at a time.

#### application.js

The `config/application` file is your application's opportunity to override any project or task configuration defaults set by Lineman. The object you return from the function the module exports will be merged onto the default configuration just before being passed to [grunt.config.init](http://gruntjs.com/api/grunt.config#grunt.config.init), which means your application can override, replace, or remove any of the built-in tasks, or define all new ones.

Let's start with an example. Suppose you want to override Lineman's built-in [jshint](http://www.jshint.com/) configuration to allow constructor functions to start with lower-case letters. Currently, Lineman sets the property associated with this rule ("newcap") to `true`. You could relax this rule in `config/application` like this:

``` javascript
module.exports = function(lineman) {
  return {
    jshint: {
      options: {
        newcap: false
      }
    }
  };
};
```

We can verify this change by either running and testing our app or interrogating the configuration with `lineman config jshint.options` and verifying that we see `"newcap": false` where we expect it.

Sometimes, you'll want to peek at the existing lineman application config. You can do this from the function's provided `lineman` argument. Specifically, we frequently want to provide a concatenation—as opposed to an outright overwrite—of array-value properties.

In example, if we were to append a task to the "common" build phase (meaning we want it to run both during `lineman run` and `lineman build`), we'd want to concatenate our addition to the existing array to ensure we don't incidentally overwrite a previous configuration file or plugin's changes. *[Editor's note: we agree that this is currently a bit onerous and error-prone; we're working on an API that improves on this particular case]*:

``` javascript
module.exports = function(lineman) {
  var app = lineman.config.application;
  return {
    appendTasks: {
      common: app.appendTasks.common.concat("myTask")
    }
  };
};
```

(A word of warning: mutating values directly on the `lineman.config.application` is not supported and will probably break in a subsequent release.)

One last fun trick with `config/application` is that, you can refactor your application config—should it ever become so large as to be unwieldy—into as many "plugin" files as you like in your app under `config/plugins/*.{js,coffee}`. Despite the name, there's no need to pull that config out into a separate module, it's just a convenience for breaking up large configurations down into more focused ones. For details on the API for plugin files, check out [Creating Lineman Plugins](#creating-lineman-plugins)


#### files.js

To make it easier to reuse file patterns across multiple task configurations, Lineman (for the most part) pulls out file glob configuration into a separate section of the application config under a "files" property. It's recommended you override this from the `config/files` file.

The most common override folks need to make is to override the load order of the third-party vendor JavaScript files their app depends on. To discover the default file globs for JavaScript, one could run `lineman config files.js` and see:

``` javascript
{
  "app": "app/js/**/*.js",
  "vendor": "vendor/js/**/*.js",
  "spec": "spec/**/*.js",
  "specHelpers": "spec/helpers/**/*.js",
  "concatenated": "generated/js/app.js",
  "concatenatedSpec": "generated/js/spec.js",
  "minified": "dist/js/app.js",
  "minifiedWebRelative": "js/app.js"
}
```

Knowing this, we can easily override the "files.js.vendor" property by supplying an array of patterns, like so:

``` javascript
module.exports = function(lineman) {
  return {
    js: {
      vendor: [
        "vendor/js/underscore.js",
        "vendor/js/jquery.js",
        "vendor/js/bootstrap/**/*.js",
        "vendor/js/backbone.js",
        "vendor/js/**/*.js"
      ]
    }
  };
};
```

The above configuration will still load all of the scripts placed in `vendor/js`, but will ensure Underscore comes first, followed by jQuery, anything in the "vendor/js/bootstrap" directory, and then Backbone.

To understand the supported patterns (including how to exclude patterns), check out the underlying [grunt.file.expand](http://gruntjs.com/api/grunt.file#grunt.file.expand) API.

If you intend to extend Lineman with custom tasks or plugins, we encourage you to add additional file property paths to the files configuration (as opposed to hard-coding them in your relevant task configurations). You can use Grunt's configuration interpolation to expand them later. For instance, the `files.js.vendor` path above is referenced from an actual task configuration like so:

``` bash
$ lineman config concat_sourcemap.js
{
  "src": [
    "<%= files.js.vendor %>",
    "<%= files.template.generated %>",
    "<%= files.js.app %>",
    "<%= files.coffee.generated %>"
  ],
  "dest": "<%= files.js.concatenated %>"
}
```

#### lineman.js

This is a handy little shim that you can require whenever you need access to the application's `lineman` object from some Node.js context, for instance from a custom grunt task. Keep in mind that its `lineman.config` value won't be fully-baked when required this way.

#### server.js

You can use `config/server` to specify custom routes that Lineman's development server will respond to, for the purpose of [API Stubbing](#api-integration).

#### spec.json

This file is the Testem (the underlying test runner invoked by `lineman spec` and `lineman spec-ci`) configuration file. Check out details for customizing it at [Testem's readme](https://github.com/airportyh/testem#configuration-file). Some Lineman-specific examples are [available here](#testem-configuration).
