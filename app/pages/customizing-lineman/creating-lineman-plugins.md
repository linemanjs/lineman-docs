---
title: "Creating Lineman Plugins"
category: "customizing-lineman"
slug: "creating-lineman-plugins"
ordinal: 3
---

Writing your own Lineman plugin is refreshingly easy! The most important thing to remember is that Lineman's job is typically only to provide *sensible default task configuration* and some level of *build awareness*. If a Grunt task module distributed via npm is a chocolate, then a Lineman plugin that sets it up and incorporates it into users' project builds is merely its *thin candy shell*. This narrow focus has enabled us to write clear and focused plugins that provide a lot of value without requiring a lot of code.

Here are some of the things a typical plugin might do, in descending order of likelihood:

1. Depend on one or more grunt task modules, adding them to `loadNpmTasks` ([Example](https://github.com/linemanjs/lineman-dogescript/blob/master/package.json#L16))
2. Define task configurations in a `config/plugins/my-task-here.{js,coffee}` file ([Example](https://github.com/linemanjs/lineman-dogescript/blob/master/config/plugins/dogescript.coffee#L16-L28))
3. Prepend/Append the task to the dev, dist, or common build phase ([Example](https://github.com/linemanjs/lineman-dogescript/blob/master/config/plugins/dogescript.coffee#L13-L14), [Doc](http://localhost:8000/#adding-tasks))
4. Define new file patterns to be used by your tasks & users ([Example](https://github.com/linemanjs/lineman-dogescript/blob/master/config/plugins/dogescript.coffee#L5-L8))
5. Include all-new Grunt tasks within the plugin module in a `tasks/*.{js,coffee}` file
6. Create prerequisite files in users' projects with a postinstall script (Example: [pt. 1](https://github.com/linemanjs/lineman-bower/blob/master/package.json#L10-L12) [pt. 2](https://github.com/linemanjs/lineman-bower/blob/master/script/postinstall.js))


#### Project setup

First off, every plugin's name must start with the string "lineman-" in order to be discovered and auto-loaded by Lineman.

Next, the plugin's `package.json` file should declare "lineman" as a peer dependency like so:

``` javascript
"peerDependencies": {
  "lineman": ">= 0.24.0"
}
```

Try to ensure you pick a version specifier that's high enough to ensure it'll work (for reference, plugins were introduced in `lineman@0.19.0`).

Finally, any grunt task modules or other runtime dependencies you need should be included in the "dependencies" object, so that they'll be installed and available to the end user (this is a little counter-intuitive since your plugin itself will be in your users' "devDependencies" objects).

#### Defining configurations

The plugin API couldn't be much more familiar, as it closely resembles the format of each Lineman project's `config/application` and `config/files` files. Your plugin may define any number of JavaScript and CoffeeScript files under `config/plugins` and they'll be automatically picked up and run by Lineman, merged into an ever-growing projec.t configuration.

A plugin file looks like:

```
module.exports = function(lineman) {
  return {
    files: {
      //Any file patterns you have can go here
    },
    config: {
      //Any project & task configurations go here
    }
  };
};
```

The provided `lineman` object exposes the current configuration (as it exists just prior to loading your plugin file) under `lineman.config`. Keep in mind that you'll definitely want to concat any array-type configuration values unless you intend to overwrite them entirely. For instance, setting `loadNpmTasks: ["my-task-module"]` would have the unintended consequence of overwriting all the tasks loaded by any previous plugins.

#### Publish your plugin

We recommend testing your plugin locally with [npm link](https://www.npmjs.org/doc/cli/npm-link.html) from a local project, but once it's ready, all you need to do is publish it to npm. If this is your first time, check out [npm's docs](https://www.npmjs.org/doc/publish.html).


