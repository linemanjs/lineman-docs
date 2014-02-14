---
title: "Adding Grunt Tasks"
category: "customizing-lineman"
slug: "adding-tasks"
ordinal: 4
---

#### Adding NPM based tasks

To load NPM-based tasks that aren't part of the standard Lineman dependencies, you can add the module names to the `loadNpmTasks` object in `config/application.js`. Note that these still need to be added to your app's `package.json` dependencies and installed to `node_modules` with `npm install`.

```javascript
  loadNpmTasks: lineman.config.application.loadNpmTasks.concat("npm_task_to_load")
```

#### Adding Custom tasks

Lineman will automatically require all files in the `tasks` directory and load them into Grunt. If you have custom tasks, you can leave them there and add them to the build as above.

Lineman can easily be extended to do extra grunt-work for your application above-and-beyond the built-in grunt tasks. You may add tasks to your project in two ways:

* If you're writing a task yourself, add it to the `tasks/` directory. Lineman will automatically load any tasks found here.
* If you want to use a task that's packaged in an external npm module, add it to your `package.json` as a dependency and run `npm install`.

Once they're loaded, you can manually run the task from the command line using `lineman grunt` (which just delegates through to `grunt`):

```bash
$ lineman grunt taskname
```

But you're probably more interested in adding the custom task to run along with the other tasks in `lineman run` and/or `lineman build`. You can add any task to these commands by adding it to the appropriate array under the `appendTasks` object in `config/application.js`:

```javascript
  prependTasks: {
    common: ["A"],
    dev: ["B"],
    dist: ["C"]
  },
  appendTasks: {
    common: ["D"],
    dev: ["E"],
    dist: ["F"]
  }
```

In the above example, tasks "A" & "D" would run during *both* `lineman run` and `lineman build`. Meanwhile, "B" & "E" would run only during `lineman run`, while "C" & "F" would only run during `lineman build`.

Tasks specified under `prependTasks` way will be run before Lineman's built-in tasks for the corresponding phase, while tasks specified under `appendTasks` will run immediately afterward. For reference, [check out](https://github.com/linemanjs/lineman/blob/f13bde48c639569be3d50ec148e2c0e018d66ba0/config/application.coffee#L11-L14) Lineman's default configuration.

If you need more fine-grained control—say you want to *replace or remove* a default task—you can use custom JavaScript in your application config file to edit the appropriate array directly; [here's an example of removing a task](https://github.com/searls/lineman-ember-template/blob/941e7e63306aecbdce5b9a1223bfdb85bf5fe498/config/application.coffee#L30-L31) from the [Ember.js template](https://github.com/searls/lineman-ember-template).
