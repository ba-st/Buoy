# SUnit

## `TestAsserter` extensions

- `assert:hasTheSameElementsInTheSameOrderThat:` asserts that two
  sequenceable collections have the same elements in the same order
- `assert:includes:` asserts that a collection includes an element
- `deny:includes:` denies that a collection includes an element
- `should:raise:withMessageText:` asserts that a block raises a specific
  exception including a specific message text
- `withTheOnlyOneIn:do:` provides a facility to assert that a collection has
  only one element and evaluates a block with it

### `TestAsserter` extensions for GS64

- `assert:identicalTo:` asserts that an object is identical to another one
- `deny:identicalTo:` denies that an object is identical to another one
- `assertCollection:hasSameElements:` asserts that two collections have the
  same elements
- `fail` will make the test fail
- `should:raise:withExceptionDo:` asserts that a block raises a specific
  exception and evaluates the provided block with the signal
  