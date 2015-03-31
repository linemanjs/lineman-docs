---
title: "Using Sass (with Ruby)"
category: "advanced-features"
slug: "using-sass"
ordinal: 4
---

Lineman supports [Sass](http://sass-lang.com/) via [grunt-contrib-sass](https://github.com/gruntjs/grunt-contrib-sass). Because the `sass` task requires Ruby & the "sass" gem to be installed in order to function, it is disabled by default.

First, to enable sass, in your `config/application.js` file, uncomment `enableSass: true`:

``` javascript
module.exports = function(lineman) {
  return {
    //...
    enableSass: true
    //...
  };
};
```

Once Sass is enabled, it will look for a "**main.scss**" or "**main.sass**" file in `app/css`. Rather than concatenating all the source files you include in your project, Sass files will only be included as you `@import` them from your main file. If you'd like to override this default entry-point file, override the `files.sass.main` config in `config/files.js` like so:

``` javascript
module.exports = function(lineman) {
  return {
    sass: {
      main:"app/css/my_app_styles.{sass,scss}"
    }
  };
};

```

#### Setting up ruby

Sass requires the "sass" ruby gem to be installed. (For info on installing ruby see [rvm](http://rvm.io) or [rbenv](https://github.com/sstephenson/rbenv)+[ruby-build](https://github.com/sstephenson/ruby-build)). To install the "sass" gem, run:
``` bash
$ gem install sass
```

We recommend you lock down the version of Sass your project uses with Bundler. To do so, create a `Gemfile` at your project root with:

``` ruby
source "https://rubygems.org"

gem "sass"
```

Then run `bundle install`, which will generate a `Gemfile.lock` (commit both to version control). Finally, tell the grunt task to invoke the locked version of Sass with the following configuration in `config/application.js`:

``` javascript
sass: {
  options: {
    bundleExec: true
  }
}
```

For more information on overriding the task's options, please check out grunt-contrib-sass's [README](https://github.com/gruntjs/grunt-contrib-sass).
