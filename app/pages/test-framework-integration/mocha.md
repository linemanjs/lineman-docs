---
title: "Mocha"
category: "test-framework-integration"
slug: "mocha"
ordinal: 3
---

1. Remove the jasmine-* helpers in `spec/helpers/`
2. Change the framework in `config/spec.json`:
```
{
    "framework": "mocha"
    ...
}
```
3. Put your desired expectation/assertion library in `spec/helpers/`, e.g. [expect.js](https://github.com/LearnBoost/expect.js).
