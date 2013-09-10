---
title: "Lineman vs Yeoman"
category: "questions-and-answers"
slug: "lineman-vs-yeoman"
ordinal: 1
---

We are commonly asked, "How does Lineman differ from Yeoman?". Firstly, Lineman is a generalists tool designed primarily to ease the creation of modern-client web applications. It is client-side framework agnostic, but opinionated about the workflow and tools developers use to _build_ modern-client apps. However, given there is _some_ overlap between the two tools we thought it best to lay things out with a feature grid:

```bash
+------------------------------------------------------------------------------+
| Feature                   | Lineman                | Yeoman                  |
|---------------------------|------------------------|-------------------------|
| Generators                | 1 builtin scaffold,    | No builtin scaffolds,   |
|                           | clonable templates, no | installable generators, |
|                           | sub-generators.        | many sub-generators.    |
|---------------------------|------------------------|-------------------------|
| Command Line Interface    | Wrapped utilities that | Unwrapped utilities that|
|                           | are accessed via CLI.  | are accessed via their  |
|                           | ie: `lineman grunt`    | CLI: ie: `grunt`        |
|---------------------------|------------------------|-------------------------|
| HTML5 pushState Simulator | builtin and enabled    |                         |
|                           | via `application`      |           -             |
|                           | config file            |                         |
|---------------------------|------------------------|-------------------------|
| API Stubbing/Prototyping  | builtin and enabled    |                         |
|                           | via `server` config    |           -             |
|                           | file                   |                         |
|---------------------------|------------------------|-------------------------|
| API Proxy                 | builtin and enabled    |                         |
|                           | via `application`      |           -             |
|                           | config file            |                         |
|---------------------------|------------------------|-------------------------|
| Test Runner               | testem, configured as  |                         |
|                           | dev and ci mode        |   generator specific    |
|                           | `lineman spec`         |                         |
|                           | `lineman spec-ci`      |                         |
|---------------------------|------------------------|-------------------------|
| Grunt Task Lifecycle      | preconfigured phases:  |                         |
|                           | app, dev, build        |   generator specific    |
|                           | `files` & `application`|                         |
|                           | config files           |                         |
|---------------------------|------------------------|-------------------------|
| Dependency Graph          | intentionally shallow  | generator specific      |
|                           | and lightweight.       | often deep and heavy.   |
|------------------------------------------------------------------------------|
| Cute ASCII Text Greeter   |           -            | snazzy wizard based CLI |
|------------------------------------------------------------------------------|
| Package Management        |           -            |          bower          |
|------------------------------------------------------------------------------|
| SourceMap Generation      | builtin, defaults to   |            -            |
|                           | grunt-concat-sourcemap |                         |
|------------------------------------------------------------------------------|
| Builtin Dev Server        | `lineman run`          |   generator specific    |
|                           |  spins up express.js   |                         |
+------------------------------------------------------------------------------+

```
