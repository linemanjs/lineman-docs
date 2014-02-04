---
title: "Heroku Buildpack"
category: "advanced-features"
slug: "heroku-deployment"
ordinal: 4
---

Deploying your app to [heroku](http://heroku.com) couldn't be easier. Once you have the [heroku toolbelt](https://toolbelt.heroku.com) installed, simply run this from your project:

```bash
$ heroku create --stack cedar --buildpack http://github.com/linemanjs/heroku-buildpack-lineman.git
```

Now, whenever you `git push heroku master`, our [custom buildpack](http://github.com/linemanjs/heroku-buildpack-lineman) will build your project with lineman and then start serving your minified site assets with apache!

What's really neat about this workflow is that while heroku takes care of building the assets for you (meaning you don't have to worry about checking in or transferring any generated assets), at runtime node is nowhere to be found! Your site is just static assets running on apache.
