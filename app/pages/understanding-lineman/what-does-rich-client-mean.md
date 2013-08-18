---
title: "What does 'rich-client' mean?"
category: "understanding-lineman"
slug: "rich-client"
ordinal: 2
---

Traditional web applications are written using server-side frameworks that happen to support the generation of HTML and embedding of JavaScript and CSS. Many of these frameworks maintain strong opinions about how you should structure your server-side code yet often treat client-side code as an afterthought.

<img src="http://placehold.it/850x75&text=traditional: full page reload, server-side html rendering, server-side routing">

With the rise of the MV* pattern on the client-side, many web developers are building web applications using a "rich-client" model that eschews the traditional "full-page reload" lifecycle for a leaner pattern. In this "rich-client" model, web-servers are responsible for data-delivery (usually as JSON), security, authentication and data-processing/storage; the client is responsible for html rendering, routing, and application domain logic.

<img src="http://placehold.it/850x75&text=rich-client: JavaScript MV*, client-side html rendering, client-side routing">
