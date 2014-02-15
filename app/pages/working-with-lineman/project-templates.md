---
title: "Project Templates"
category: "working-with-lineman"
slug: "project-templates"
ordinal: 2
---

If you aren't sure what client-side framework you want to use for your app you may want to start with Lineman's default, framework-agnostic, project template. You can generate this project template from the command line:

```bash
$ lineman new your-project
```

Lineman then gives you some instructions on how to get up and running with this default template:

<pre><code>
    _
   | |
   | |     _ _ __   ___ _ __ ___   __ _ _ __
   | |    | |  _ \ / _ \  _   _ \ / _  |  _ \
   | |____| | | | |  __/ | | | | | (_| | | | |
   |______|_|_| |_|____|_| |_| |_|___,_|_| |_|

- Assembling your new project directory in "/Users/davidmosher/code/your-project"
- Created a new project in "your-project/" with Lineman. Yay!

Getting started:
  1. "cd your-project" into your new project directory
  2. Start working on your project!
    * "lineman run" starts a web server at http://localhost:8000
    * "lineman build" bundles a distribution in the "dist" directory
    * "lineman clean" empties the "dist" and "generated" directories
    * "lineman spec" runs specs from the "specs" directory using testem

For more info, check out http://github.com/linemanjs/lineman
</code></pre>

If you already know that you want to use a particular client-side framework (like Backbone, Ember, or Angular) we have a few framework-templates floating around to help you get up-and-running even _more_ faster:

<div class="template-projects cf">
  <a href="https://github.com/linemanjs/lineman-backbone-template" target="_blank">
    <h4>Lineman Backbone</h4>
    <div class="templates backbone"></div>
  </a>
  <a href="https://github.com/linemanjs/lineman-angular-template" target="_blank">
    <h4>Lineman Angular</h4>
    <div class="templates angular"></div>
  </a>
  <a href="https://github.com/linemanjs/lineman-ember-template" target="_blank">
    <h4>Lineman Ember</h4>
    <div class="templates ember"></div>
  </a>
  <a href="https://github.com/linemanjs/lineman-lib-template" target="_blank">
    <h4>Lineman Lib</h4>
    <div class="templates lib"></div>
  </a>
  <a href="https://github.com/linemanjs/lineman-blog-template" target="_blank">
    <h4>Lineman Blog</h4>
    <div class="templates blog"></div>
  </a>
</div>
