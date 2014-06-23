---
title: "Using LiveReload"
category: "advanced-features"
slug: "using-livereload"
ordinal: 5
---

Lineman ships with LiveReload, a server that can be used to push instructions to browsers to refresh the page whenever a change is made.

To enable LiveReload, in your `config/application.js` file, uncomment `livereload: true`:

``` javascript
module.exports = function(lineman) {
  return {
    //...
    livereload: true
    //...
  };
};
```

Once LiveReload is enabled, the `watch` task of `lineman run` will start a LiveReload server, and the `server` task will inject a JavaScript file into each HTML file served by Lineman. When the `watch` task processes your project's assets, it will trigger page-refreshes in all the browsers you're working in.

The `livereload` config property supports these options:

* `port` - the port to run the LiveReload server and to which the injected scripts should look for (default: 35729)
* `injectScript` - when enabled, a script tag will be injected into all HTML documents served by Lineman to listen to reloads triggered when files are changed and tasks run (default: true)

Therefore, if you'd like to use a browser extension (instead of script injection) to facilitate reloads and run it on port 40000, you could configure livereload like so in `config/application`:

```
{
  livereload: {
    port: 40000,
    injectScript: false
  }
}
```
