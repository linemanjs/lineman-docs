---
title: "Custom Deployment Methods"
category: "customizing-lineman"
slug: "custom-deployment-methods"
ordinal: 3
---

Can't find a deployment plugin for your setup? They're really easy to create.

When you run `lineman deploy ____`, Lineman simply checks your application configuration for a deployment target with that name. If found, it delegates the actual deployment to a grunt task with the name `lineman-deploy-{METHOD}`, with `{METHOD}` being the value of the `method` property of the deployment target.

So, if your application configuration file looks like this:

```javascript
deployment:{
	production:{
		method:'foo',
		runTests:true,
		bar:'baz'
	}
}
```

And if you have a task in your `/tasks` directory called `lineman-deploy-foo`, running `lineman deploy production` will simply run your `lineman-deploy-foo` task, passing "production" as an argument to the task. It is up to the deployment task to use the additional configuration to execute the actual deployment process.
