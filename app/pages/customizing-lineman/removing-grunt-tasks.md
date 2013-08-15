---
title: "Removing Grunt Tasks"
category: "customizing-lineman"
slug: "removing-tasks"
ordinal: 2
---

If you need to remove a task that's built into Lineman, you can use the "removeTasks" configuration. For example, if you wanted to disable Lineman's CoffeeScript task, you could do this:

```javascript
  removeTasks: {
    common: ["coffee"]
  }
```
