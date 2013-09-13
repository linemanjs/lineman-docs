---
title: "Wrapping Libraries"
category: "questions-and-answers"
slug: "wrapping-libs"
ordinal: 3
---

__Why does Lineman wrap grunt, testem and other tools instead of letting users reference them directly?__

The universe of people who understand Grunt, testem, and the myriad plugins
that Lineman depends on is a relatively tiny set of humans (in the thousands).
The audience that needs a much better front-end development workflow with
minimal additional cognitive load is absolutely enormous (in the millions).
Therefore, it doesn't make sense to bottleneck adoption of the much better
development workflows that are afforded by Grunt (et. al) by first demanding as
a prerequisite an understanding of what Lineman uses "under the hood." The user
should be able to get **some** value out of Lineman without understanding *how
it works at all*.

Additionally, by maintaining our own CLI and owning the top-level process, we
can smooth out the edges of some of the libs we depend on in ways that aren't
always possible by configuration alone. Better yet, we can swap out a
dependency more-or-less invisibly with an upgrade to Lineman.

Finally, Lineman doesn't *hide* anything that it depends on, because we know
that every single project that uses Lineman long enough will need to customize
some aspect of its workflow eventually. That's why Lineman is obscenely
extensible—literally anything Lineman configures (whether it's grunt tasks,
conventional file patterns, or test runner configuration) can be overridden
without any precognition on the part of Lineman's developers. This is one of
the reasons it's been so easy for us to adapt Lineman for use with a variety of
front-end frameworks with minimal additional code.

We view Lineman as providing just one (skinny!) layer of your front-end
workflow, as opposed to a monolithic approach like Rails provided:

| Aspect                         | The Rails Way    | Our front-end approach              |
| :--                            | :--              | :--                                 |
| Application Framework          | Rails            | Any of the 20 current front-runners |
| Conventions and Default Config | Rails            | Lineman                             |
| Build tasks                    | Rails (via Rake) | Grunt                               |
