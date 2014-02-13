---
title: "Adding Lineman Plugins"
category: "customizing-lineman"
slug: "adding-lineman-plugins"
ordinal: 2
---

Lineman includes a plugin mechanism for packaging and sharing project configurations that are likely to be common across multiple Lineman projects.

Our goal with Lineman has always been to encourage sensible commonality and decrease duplication between web projects by encapsulating sensible defaults for grunt task configurations. But what about for task configurations that aren't common to everyone? For example, it obviously wouldn't make sense for application-framework-specific build settings to make their way into the default Lineman configuration.

For cases like these, we created a way to package customizations to Grunt task configurations and Lineman's build behavior without requiring any duplication or additional end-user configuration.

We have a handful of plugins already available:

* [lineman-angular](https://github.com/linemanjs/lineman-angular) - Seen here in the [lineman-angular-template](https://github.com/linemanjs/lineman-angular-template)
* [lineman-backbone](https://github.com/linemanjs/lineman-backbone) - Seen here in the [lineman-backbone-template](https://github.com/linemanjs/lineman-backbone-template)
* [lineman-blog](https://github.com/linemanjs/lineman-blog) - Seen here in the [lineman-blog-template](https://github.com/linemanjs/lineman-blog-template)
* [lineman-bower](https://github.com/linemanjs/lineman-bower)
* [lineman-browserify](https://github.com/linemanjs/lineman-browserify)
* [lineman-dogescript](https://github.com/linemanjs/lineman-dogescript)
* [lineman-deploy-aws](https://github.com/linemanjs/lineman-deploy-aws)
* [lineman-ember](https://github.com/linemanjs/lineman-ember) - Seen here in the [lineman-ember-template](https://github.com/linemanjs/lineman-ember-template)
* [lineman-jade](https://github.com/aranasoft/lineman-jade)
* [lineman-lib](https://github.com/linemanjs/lineman-lib) - Seen here in the [lineman-lib-template](https://github.com/linemanjs/lineman-lib-template)
* [lineman-rails](https://github.com/linemanjs/lineman-rails) - Used in [Rails+Lineman integration](/rails.html)

As you can see by skimming the list above, the motivation behind various plugins can differ wildly. Some support productivity tools like bower and browserify. Some add tighter integration with application frameworks, like Angular or Ember. Others add entirely new languages, like dogescript & jade. We're also working on plugins that provide deploy-time behavior, like [lineman-deploy-aws](https://github.com/linemanjs/lineman-deploy-aws) will.

If you're interested in a particular plugin, we recommend you poke around its repository a little bit to see what grunt task modules it includes, what custom tasks it defines, and what configurations it overrides or adds in `config/plugins/*.js`. When you're ready to give a plugin a spin, all you need to do is install and save it to your project's package.json, like so:

``` bash
$ npm install --save-dev lineman-jade
```

The example above will install lineman-jade to `node_modules/` and, merely by virtue of being listed as a dependency in your `package.json`, will be discovered by the `lineman` CLI, loaded, and applied to the project's configuration. You can add as many plugins to your project as you like; Lineman will start with its default configurations and successively merge in the configuration extensions defined by each plugin you specify, before ultimately merging in your application's configuration.

It's also worth noting that plugins can include plugins and Lineman will load them recursively. So for example, if you wanted to publish a slightly (but hopefully, meaningfully) different Angular configuration, you could write a plugin that depends on [lineman-angular](https://github.com/linemanjs/lineman-angular) and only overrides the configuration to the extent that it differs from that plugin. On that note, let's talk about how to write your own plugin next.
