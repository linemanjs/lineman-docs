---
title: "Heroku Buildpack"
category: "advanced-features"
slug: "heroku-deployment"
ordinal: 4
---

Deploying your app to [heroku](http://heroku.com) couldn't be easier. Once you have the [heroku toolbelt](https://toolbelt.heroku.com) installed, simply run this from your project:

```
$ heroku create <name>
$ heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-nodejs
$ heroku config:set NPM_CONFIG_PRODUCTION=false
```

As of version 0.35.1, Lineman includes a Procfile and npm script that should work fine with the official Node.js buildpack.

### Legacy buildpack

If you're on an older version of lineman, need to run on an Apache2 server, or if you're using Sass, we also have a custom buildpack available. You can set it up like so:


```bash
$ heroku create --stack cedar --buildpack http://github.com/linemanjs/heroku-buildpack-lineman.git
```

Now, whenever you `git push heroku master`, our [custom buildpack](http://github.com/linemanjs/heroku-buildpack-lineman) will build your project with lineman and then start serving your minified site assets with apache!

What's really neat about this workflow is that while heroku takes care of building the assets for you (meaning you don't have to worry about checking in or transferring any generated assets), at runtime node is nowhere to be found! Your site is just static assets running on apache.
