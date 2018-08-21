---
title: Collections
---

## Circular Iterator

A `CircularIterator` provides an abstraction to iterate over a collection rolling over when the end is reached:

```smalltalk
| iterator |
iterator := CircularIterator cyclingOver: 'abc'.
iterator next "$a".
iterator next "$b".
iterator next "$c".
iterator next "$a".
iterator next "$b".
```
