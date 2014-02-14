---
title: "Sub Generators"
category: "questions-answers"
slug: "sub-generators"
ordinal: 2
---

__Why doesn't Lineman have sub-generators for its project templates?__

Generated code, like fish, begins to smell after three days.

For the maintainers, it's yet another thing they need to keep in sync with the library-dependent code that's being generated; worse, if the library makes BC-breaking changes, the code generators need to become smart enough to generate one among multiple versions of the code (after detecting which version of the library the user is depending on).

For the users, it can certainly help overcome "blank page paralysis" and help them to get started, but the generated code often introduces other immediate issues caused by an uncertain understanding of what was just generated. We saw this with `rails scaffold` all the time back in the day—folks would absolutely love it in demos, but upon looking at the bizarre controller & view code that emerged, they felt less command and ownership over it than they would have if they had rolled their own. That is to say that generating a quick start to an activity typically doesn't cure "blank slate paralysis", it merely defers it—and worse, to a point where you already have the carrying cost of code to maintain.

There is a caveat, I think: a generator that produces only a *very tiny amount of code* (like a `rails g migration` generator) can absolutely prove handy when (a) it's very small and (b) the code that it's generating has some element that makes it a pain to do by hand. (In the case of Rails database migrations, that painful aspect is the timestamp needed in the migration's file name.)

But generally, code generation is very hard to implement well, and it's even harder when the code being generated *depends on a library you don't own*. It essentially guarantees that Yeoman's sub-generators can't be delivered in a quality, forward-compatible way. That team is hereby doomed to get a bunch a 3 a.m. issues filed on account of generating out-of-date code, brought on by the innocent March of Progress by whatever library the generator targets.
