---
title: "What is a 'first-class' web app?"
category: "understanding-lineman"
slug: "first-class"
ordinal: 3
---

It is an unfortunate reality that client-side code is often not given the same level of care and attention that is given to server-side code. Many times this "client-side inferiority complex" is aggravated as web developers move between server-side frameworks and have to re-learn how to manage client-side code within the opinions of that server-side framework.

A lack of consistency in the way client-side code is managed across server-side frameworks has left many web developers frustrated, disillusioned, or apathetic when it comes to caring about the quality of the client-side code that they write.

We built Lineman to craft a developer experience that would liberate our client-side assets from the opinions of each server-side framework and allow them to stand on their own as first-class citizens. At its core, Lineman is a fully realized client-side workflow based on sensible task defaults and a simple transparent proxy that allows web developers to completely decouple their client-side from the server-side. In addition, it produces happiness by building assets, mocking servers, and running specs on every file change.

This separation allows client-side assets to stand on their own as first-class citizens.

  ```bash
   // Development Cycle `lineman run`

   +-----------------------+                      +------------------------+
   |     Modern Client     |                      |        API Server      |
   |-----------------------|      apiProxy        |------------------------|
   | Lineman:              | <------------------> | Any Backend Platform:  |
   | - Any Client MV*      |                      | - Security             |
   | - Test Execution      |         OR           | - Auth                 |
   | - CI Integration      |                      | - API Routing          |
   | - Build Tool          | <------------------+ | - Application Logic    |
   | - Coffee, JavaScript  |                    | | - ORM                  |
   | - SASS, Less          |      apiStubbing   | |                        |
   | - Dev Server          |                    | |                        |
   | - pushState Simulator | +------------------+ |                        |
   +-----------------------+                      +------------------------+
  ```

  ```bash
  // Production Deployment `lineman build`

  +-----------------------+                      +---------------------------------------+
  |     Modern Client     |                      |    Production Application Server      |
  |-----------------------|   `lineman build`    +-----------------------+---------------|
  |                       |                      |                       |               |
  | Lineman:              | -------------------> | build artifact: +     | web front end:|
  | - Any Client MV*      |                      | ./dist          |     | - nginx/apache|
  | - Test Execution      |                      | - index.html    |     | - app server  |
  | - CI Integration      |                      | - app.css       +-------+ public/html |
  | - Build Tool          |                      | - app.js              |               |
  | - Coffee, JavaScript  |                      | - img/*               |               |
  | - SASS, Less          |                      |                       |               |
  | - Dev Server          |                      |                       |               |
  | - pushState Simulator |                      |                       |               |
  +-----------------------+                      +-----------------------+---------------+
  ```
