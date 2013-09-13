---
title: "HTML5 pushState Simulation"
category: "advanced-features"
slug: "push-state"
ordinal: 2
---

Lineman provides a way to direct requests to either your API or serve up
generated/index.html in order to simulate what using HTML5 pushState with a
configured static server will behave like. This requires both `apiProxy.prefix`
and `server.pushState` configuration property to be set, so that the apiProxy
correctly knows how route requests to the api you have configured. To enable
pushState in your application set the pushState flag on the server task in
`config/application.js` and the prefix on the apiProxy configuration of the
server task, like this:

```javascript
server: {
  // enables HTML5 pushState;
  // Lineman will serve `generated/index.html` for any request that does not match the apiProxy.prefix
  pushState: true,
  apiProxy: {
    enabled: true,
    port: 3000,
    prefix: 'api' // request paths that contain 'api' will now be the only ones forwarded to the apiProxy
  }
}
```
