---
title: "API Integration"
category: "advanced-features"
slug: "api-integration"
ordinal: 1
---

Most web apps require some interaction with a server, and no developer could be expected to write working code without either faking the server-side or plugging the client and server together. Lineman offers support for both!

#### API Stubbing

Users may define custom HTTP services to aid development in `config/server.js` by exporting a function named `drawRoutes`. The provided `app` is an [Express.js](http://expressjs.com/) application, so you have the entirety of its API available to you.

Here's a trivial example:

```javascript
module.exports = {
  drawRoutes: function(app) {
    app.get('/api/greeting/:message', function(req, res){
      res.json({ message: "OK, "+req.params.message });
    });
  }
};
```

API stubbing is a powerful feature that can be leveraged to use Lineman as a rapid prototyping tool and to enable front-end development to run a bit ahead of backend development (and importantly, to gather feedback and validation before investing in full-stack development). In the past, [test double](http://testdouble.com) has used API stubbing to prove out a lightweight executable specification of the services a front-end application will need in order to work. In fact, it's often useful to keep a few data structures in memory to test more complex interactions (pushing objects onto an array, deleting them by ID, etc.).

Note that this feature is intentionally only available to the development server. It is not intended to build out an actual production server, nor is it intended to be used in Lineman's built in unit test suite run with `lineman spec`.

Lineman's also watching changes you make to the server stubbing, so there's typically no need to restart your development server upon changes.

#### API Proxying

Lineman also provides a facility to forward any requests that it doesn't know how to respond to a proxy service. Typically, if you're developing a client-side app in Lineman and intend to pair it to a server-side app (written, say, in Ruby on Rails), you could run a local Rails server on port 3000 while running Lineman on port 8000, and your JavaScript could seamlessly send requests to Rails on the same port as Lineman's development server.

To enable proxying, set the `enabled` flag on the `apiProxy` configuration of the `server` task in `config/application.js`, like this:

```javascript
server: {
  apiProxy: {
    enabled: true,
    port: 3000
  }
}
```

#### Custom URL Path

If you have a need to mount your application to a custom URL path during
development (for instance, to emulate your production environment path),
you can use the `customUrlPath` option in your `server` task in
`config/application.js`, like so:

```javascript
server: {
  customUrlPath: "/custom/path"
}
```

This would result in your app being mounted at:
`http://localhost:8000/custom/path/`
