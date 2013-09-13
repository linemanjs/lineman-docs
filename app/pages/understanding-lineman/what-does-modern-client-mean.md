---
title: "What does 'modern-client' mean?"
category: "understanding-lineman"
slug: "modern-client"
ordinal: 2
---

Traditional web applications are written using server-side frameworks that happen to support the generation of HTML and embedding of JavaScript and CSS. Many of these frameworks maintain strong opinions about how you should structure your server-side code yet often treat client-side code as an afterthought.

```bash
  // Traditional Web Application

  +-----------------------+                       +------------------------+
  |        Browser        |                       |         Server         |
  |-----------------------|     HTTP Request      |------------------------|
  | - Parse & Render:     |     (Form Data)       | - Render Templates     |
  | -- HTML               | --------------------> | - Routing (App & API)  |
  | -- CSS                |                       | - Security             |
  | -- JavaScript         |   "Full Page Reload"  | - Authentication       |
  |                       |                       | - Data Storage         |
  |                       | <-------------------- | - Application Logic    |
  |                       |     HTTP Response     | - Domain Logic         |
  |                       |    (HTML, JS, CSS)    | - Asset Management     |
  |                       |                       | - Static Asset Serving |
  +-----------------------+                       +------------------------+
```

With the rise of the MV* pattern on the client-side, many web developers are building web applications using a "modern-client" model that eschews the traditional "full-page reload" lifecycle for a leaner pattern. In this model, web-servers are responsible for data-delivery (usually as JSON), security, authentication and data-processing/storage; the client is responsible for html rendering, routing, templating, and some application logic.

```bash
  // Modern Web Application

  +-----------------------+                       +------------------------+
  |        Browser        |                       |         Server         |
  |-----------------------|     HTTP Request      |------------------------|
  | - Parse & Render:     |     (JSON Data)       |                        |
  | -- HTML               | --------------------> | - Routing (API)        |
  | -- CSS                |                       | - Security             |
  | -- JavaScript         |  "Partial Rendering"  | - Authentication       |
  | - Render Templates    |                       | - Data Storage         |
  | - Application Logic   | <-------------------- |                        |
  | - Routing (App)       |     HTTP Response     | - Domain Logic         |
  |                       |     (JSON Data)       |                        |
  |                       |                       | - Static Asset Serving |
  +-----------------------+                       +------------------------+
```
