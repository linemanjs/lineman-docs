---
title: "Develop, Test, Build"
category: "working-with-lineman"
slug: "develop-test-build"
ordinal: 4
---

#### Web Server (Express JS)

Once you've generated a directory structure with the default project template,
or cloned a framework project template then it's time to get developing with
Lineman.

In your command-line interface:

1. Navigate to your project directory:

   ```bash
   $ cd your-project
   ```
2. Start Lineman's development environment:

   ```bash
   $ lineman run
   ```

3. Point your web-browser at _http://localhost:8000_

#### Test Runner (Testem)

Lineman integrates a full-featured test runner called Testem. Whether you are
using the default project template, or have cloned a framework project template
you will have a set of default tests within the `spec` directory. Lineman works
by compiling all your files whenever it detects a change on disk during
`lineman run`.

In another command-line interface session:

```bash
$ lineman spec
```

By default, Lineman configures Testem to re-run tests on every file change and
automatically launches Chrome to execute tests using a generated Jasmine
specrunner html file:

```bash
TESTEM SCRIPTS!
# Open the URL below in a browser to connect.
http://localhost:7357/

Chrome 28: ✔ 1 tests complete.

[Press ENTER to run tests; q to quit]
```

#### Continuous Integration (Testem)

Lineman comes pre-configured to execute your tests using Testems "CI" mode
which will run tests against Phantom JS and yield output in TAP13 format which
is easy for CI environments (such as Jenkins) to consume:

```bash
$ lineman spec-ci
```

The `spec-ci` command will compile your app, and then run tests within
PhantomJS 1.9:

```bash
Running "spec-ci" task
ok 1 PhantomJS 1.9 - .helloText then expect(this.result).toEqual("Hello, World!").

1..1
# tests 1
# pass  1
# fail  0

Done, without errors.
```

#### Build Tool (Grunt)

When you are ready to bundle up your modern-client app and add the compiled
JavaScript, HTML, CSS, Images, and Webfonts to your static web server you can
use Lineman's build command:

```bash
$ lineman build
```

This will execute all of Lineman's `common` and `dist` phase tasks:

```bash
Running "common" task

Running "coffee:compile" (coffee) task
File generated/js/app.coffee.js created.
File generated/js/spec.coffee.js created.
>> Destination (generated/js/spec-helpers.coffee.js) not written because compiled files were empty.

Running "less:compile" (less) task
>> Destination not written because no source files were found.
File generated/css/app.less.css created.

Running "jshint:files" (jshint) task

Running "handlebars:compile" (handlebars) task
>> Destination not written because compiled files were empty.

Running "jst:compile" (jst) task
File "generated/template/underscore.js" created.

Running "concat:js" (concat) task
File "generated/js/app.js" created.

Running "concat:spec" (concat) task
File "generated/js/spec.js" created.

Running "concat:css" (concat) task
File "generated/css/app.css" created.

Running "images:dev" (images) task
Copying images to 'generated/img'

Running "webfonts:dev" (webfonts) task
Copying webfonts to 'generated/webfonts'

Running "pages:dev" (pages) task
generated/index.html generated from app/pages/index.us

Running "dist" task

Running "uglify:js" (uglify) task
File "dist/js/app.js" created.

Running "cssmin:compress" (cssmin) task
File dist/css/app.css created.

Running "images:dist" (images) task
Copying images to 'dist/img'

Running "webfonts:dist" (webfonts) task
Copying webfonts to 'dist/webfonts'

Running "pages:dist" (pages) task
dist/index.html generated from app/pages/index.us

Done, without errors.
```

Lineman will use Grunt to execute a number of tasks and generate your
production bundle in the `dist` folder at the root of your project directory,
here's what the output looks like:

```bash
$ ls -la dist/

css
index.html
js
```
