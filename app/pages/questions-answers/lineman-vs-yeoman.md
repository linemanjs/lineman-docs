---
title: "Lineman vs Yeoman"
category: "questions-answers"
slug: "lineman-vs-yeoman"
ordinal: 1
---

We are commonly asked, "How does Lineman differ from Yeoman?". Firstly, Lineman is a tool designed primarily to ease the creation of modern-client web applications. It is client-side framework agnostic, but opinionated about the workflow and tools developers use to _build_ any modern-client apps. However, given there is _some_ overlap between the two tools we thought it best to lay things out with a feature grid:

| Feature | Lineman | Yeoman |
|:--|:--|:--|
| Generators                | 1 builtin scaffold, clonable templates, no sub-generators       | No builtin scaffolds, installable generators, many sub-generators |
| Command Line Interface    | Wrapped utilities that are accessed via CLI ie: `lineman grunt` | Unwrapped utilities that are accessed via their CLI ie: `grunt`   |
| HTML5 pushState Simulator | builtin and enabled via `config/application` | - |
| API Stubbing Prototyping | builtin and enabled via `config/server` | - |
| API Proxy | builtin and enabled via `config/application` | - |
| Test Runner | testem, configured for dev and ci mode with `lineman spec`<br> and `lineman spec-ci` | - |
| Grunt Task Lifecycle | preconfigured phases: `common, dev, dist`, split into `config/files` and `config/application` | generator specific |
| Dependency Graph | intentionally shallow and lightweight | generator specific, often deep and heavy |
| Cute ASCII Text Greeter | - | snazzy wizard based CLI |
| Package Management | none builtin but supports various, including bower, via extensions | bower |
| SourceMap Generation | builtin, defaults to `grunt-concat-sourcemap` | - |
| Dev Server | `lineman run`, spins up express.js | generator specific |
| Directory Structure | common across project templates | generator specific |
| License | [MIT](http://choosealicense.com/licenses/mit/) | [BSD](http://choosealicense.com/licenses/bsd/) |
