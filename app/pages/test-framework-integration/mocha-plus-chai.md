---
title: "Mocha+Chai"
category: "test-framework-integration"
slug: "mocha-plus-chai"
ordinal: 4
---

1. Remove the jasmine-* helpers in `spec/helpers/`
2. Change the framework in `config/spec.json`:
```
{
    "framework": "mocha+chai"
    ...
}
```
3. Set Chai as your expectation library in `spec/helpers/helper.js`:
```javascript
var expect = chai.expect;
```
