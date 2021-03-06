---
title: "Lineman Pages"
category: "advanced-features"
slug: "lineman-pages"
ordinal: 3
---

Lineman allows you to generate multiple HTML files using its "pages" feature. You _could_ use this to create an app with separate pages, or customize Lineman's tasks to generate separate web apps for each HTML file. Any template files placed within `app/pages` will automatically be compiled to HTML and placed within the root of `dist` when built. Here's an example:

1. Add an `other-app.us` template at `app/pages/other-app.us`
2. During `lineman run` you can access this page at `http://localhost:8000/other-app.html`
3. During `lineman build` this page will be placed at `dist/other-app.html`
