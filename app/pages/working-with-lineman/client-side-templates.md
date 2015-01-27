---
title: "Client Side Templates"
category: "working-with-lineman"
slug: "client-side-templates"
ordinal: 4
---

Lineman comes pre-configured with support for both [underscore](http://underscorejs.org/#template) (.us) and [handlebars](http://handlebarsjs.com/) (.hb) client-side templates.
While underscore support requires no additions, in order to take advantage of Handlebars you'll need to add the [Handlebars Runtime](http://builds.handlebarsjs.com.s3.amazonaws.com/handlebars.runtime-v2.0.0.js) to your `vendor/js` folder.

Additional client-side template types (like .JSX for React, etc..) can be supported with their respective grunt plugins.
