---
title: "Develop, Test, Build"
category: "working-with-lineman"
slug: "develop-test-build"
ordinal: 4
---

#### Web Server (Express JS)

Once you've generated a directory structure with the default project template, or cloned a framework project template then it's time to get developing with Lineman.

In your command-line interface:

1. Navigate to your project directory:

  ```bash
  $ cd your-project
  ```

2. Start Linemans development environment:

  ```bash
  $ lineman run
  ```

3. Point your web-browser at _http://localhost:8000_

<img src="http://placehold.it/850x100&text=image of `lineman run` here" />

#### Test Runner (Testem)

Lineman integrates a full-featured test runner called Testem. Whether you are using the default project template, or have cloned a framework project template you will have a set of default tests within the `spec` directory. Lineman works by compiling all your files whenever it detects a change on disk during `lineman run`, Lineman also configures Testem to re-run tests on every file change.

In another command-line interface session:

1. Start the tests:

  ```bash
  $ lineman spec
  ```

<img src="http://placehold.it/850x100&text=image of `lineman spec` here" />

#### Continuous Integration (Testem)

Lineman comes pre-configured to execute your tests using Testems "CI" mode which will run tests against Phantom JS and yield output in TAP13 format which is easy for CI environments (such as Jenkins) to consume:

1. Execute tests in ci mode:

  ```bash
  $ lineman spec-ci
  ```

<img src="http://placehold.it/850x100&text=image of `lineman spec-ci` here" />

#### Build Tool (Grunt)

When you are ready to bundle up your rich-client app and add the compiled JavaScript, HTML, CSS, Images, and Webfonts to your static web server you can use Linemans build command:

1. Build for production:

  ```bash
  $ lineman build
  ```

Lineman will use Grunt to execute a number of tasks and generate your production bundle in the `dist` folder at the root of your project directory.

<img src="http://placehold.it/850x100&text=image of `lineman build` here" />

