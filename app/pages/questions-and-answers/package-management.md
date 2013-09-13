---
title: "Package Management"
category: "questions-and-answers"
slug: "package-management"
ordinal: 5
---

__Why doesn't Lineman use Bower or any other Package Management tools?__

For the same reason Lineman doesn't care to know which front-end JavaScript
framework you choose to build your application with: if you ask a hundred
front-end developers how it ought to work, you'll get a hundred different
answers. Even developers who agree on a tool tend to arrive with different
expectations at where to draw the boundaries between automation and convention.
A bunch of questions arise, and the answer to each will narrow Lineman's
audience; questions like: should we limit our dependency management to fetching
libs? Should we include a module requirement mechanism? Should we encourage
asynchronous script loading? Should that be configured or declarative?

There's simply way too much variety and churn in this space to pick a path and
be confident that it'll have been the right decision multiple years from now
(in fact, our money is that none of the current approaches will mature into the
eventual browser-supported standard in a forward-compatible way). I've written
about this topic at length and why I view it as a concern that's not critical
enough to concern myself with yet at [our
blog](http://blog.testdouble.com/posts/2013-06-16-unrequired-love.html)
