---
title: "What does 'modern-client' mean?"
category: "understanding-lineman"
slug: "modern-client"
ordinal: 2
---

Traditional web applications are written using server-side frameworks that happen to support the generation of HTML and embedding of JavaScript and CSS. Many of these frameworks maintain strong opinions about how you should structure your server-side code yet often treat client-side code as an afterthought.

<img src="/img/traditional.webapp.png" alt="A traditional web app responsibility breakdown">

With the rise of the MV* pattern on the client-side, many web developers are building web applications using a "modern-client" model that eschews the traditional "full-page reload" lifecycle for a leaner pattern. In this model, web-servers are responsible for data-delivery (usually as JSON), security, authentication and data-processing/storage; the client is responsible for html rendering, routing, templating, and application presentation logic.

<img src="/img/modern.webapp.png" alt="A modern web app responsibility breakdown">
