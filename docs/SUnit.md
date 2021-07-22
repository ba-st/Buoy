# SUnit

## `TestAsserter` extensions

- `assert:hasTheSameElementsInTheSameOrderThat:` asserts that two
  sequenceable collections have the same elements in the same order
- `assert:includes:` asserts that a collection includes an element
- `deny:includes:` denies that a collection includes an element
- `should:raise:withMessageText:` asserts that a block raises an specific
  exception including a specific message text
- `withTheOnlyOneIn:do:` provides a facility to assert that a collection has
  only one element and evaluates a block with it
