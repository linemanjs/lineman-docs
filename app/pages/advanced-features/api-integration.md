---
title: "API Integration"
category: "advanced-features"
slug: "api-integration"
ordinal: 1
---

Many fat-client apps require some interaction with a server, and no developer could be expected to write working code without either faking the server-side or plugging the client and server together. Lineman offers support for both!

#### API Stubbing

Users may define custom HTTP services to aid development in `config/server.js` by exporting a function named `drawRoutes`. Here's a trivial example:

```javascript
module.exports = {
  drawRoutes: function(app) {
    app.get('/api/greeting/:message', function(req, res){
      res.json({ message: "OK, "+req.params.message });
    });
  }
};
```

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
