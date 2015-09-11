---
title: "Fetching 3rd-party libraries"
category: "working-with-lineman"
slug: "fetching-3rd-party-libraries"
ordinal: 6
---

Lineman includes a `fetch` CLI command for the express purpose of downloading well-known libraries (like jQuery, Ember, Underscore, etc.) and placing them in the correct directory of your application for you.

#### Fetching a library

``` bash
$ lineman fetch ember
```

Running this command will use our [fetcher](https://github.com/testdouble/fetcher) library to first clone our [repo of lineman fetch recipes](https://github.com/linemanjs/fetcher-recipes/tree/master/recipes). Then, because an "ember" recipe exists, Ember.js will be downloaded and copied to `vendor/js/ember.js` with a message about Ember's dependencies and how you might consider configuring the order of your vendor JavaScript.

#### Why blindly fetch & commit 3rd-party assets?

The `fetch` utility could be seen as a sort of poor man's [Bower](http://bower.io). In our experience, we've struggled to meet *all* of our needs with component-specification-based or module-based dependency tools for our front-end code. We eagerly *desire* these tools to mature and meet all of our needs, but to this point we're often more productive just fetching and committing third-party assets into our application repositories.

A few issues we've run into with the various tools that manage client-side dependencies for you:

* Some fetch the library's MASTER ref in git by default, which can't be assumed to be stable.
* While most tools will (usually) expose the entrypoint file of a library, they won't always, and they often have no facility for exposing all the important files in a structured way
* Many libs include fonts, images, and CSS and these tools either don't consider those or don't intelligently expose the paths of these assets
* Our applications seem to quickly become littered with symlinks, custom `grunt-contrib-copy` task targets, and complex concatenation globbing

Our (hopefully stop-gap) solution to this problem is to embrace the messy nature of third-party dependencies and take advantage of Lineman's conventional directory structure to fetch libraries for you. This requires us to maintain a [repository of recipes](https://github.com/linemanjs/fetcher-recipes/tree/master/recipes) which specify the relationship between remote assets and their destination directories, but we'd rather externalize that knowledge than require every Lineman user to internalize it.

#### Maintaining your own Recipes Repository

If you want to maintain your own repository of recipes you can do so by overriding `fetcher.recipeRepo` inside of `config/application.{js,coffee}` like so:

```
fetcher: {
  recipeRepo: "https://github.com/davemo/fetcher-recipes"
}
```
