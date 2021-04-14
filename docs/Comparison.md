# Comparison

This package includes classes to ease the comparison of objects both for equality and identity. They are typically used to implement the `=` and `hash` methods.

## Hash Combinators

Hash combinators help to implement the `hash` or `identityHash` methods by providing an easy way to combine hashes. Any object can send to itself the `equalityHashCombinator` message and then use it to calculate the combined hash value. The default equality hash combinator uses bitXor operations, but any object can override this default behavior and provide a more specific policy.

It will apply the combinator operator to each one of the objects:

- `combineHashesOfAll:` will send the hash message to every object in the collection and then combine them.
- `combineHashOf:with:` will send the hash message to the two objects and then combine them.
- `combineAll::` expectes a collection of hashes and will combine them.
- `combine:with:` will combine two hash values

### Hash Combinator Examples

```smalltalk
hash

  ^ self equalityHashCombinator combineAll: #(2 5 6)

hash

  ^ self equalityHashCombinator combineHashesOfAll: { alpha. beta. gamma }
```

## Equality Checkers

Equality checkers help to implement the equality method for objects. Any object can send to itself the message `equalityChecker`, configure it and then use it to check against the target object of the comparison.

Equality checkers always performs a `==` comparison first and proceeds with the rest of the rules only if the objects are not identical.

By default `equalityChecker` is an instance of `PropertyBasedEqualityChecker` and it alredy knowns the receiving instance. It can be configured with:

- `compare: selector` will add a rule to the checker that sends the provided message on the receiver and target object and compare the results by `=`
- `compare: block` will add a rule to the checker that evaluates the provided block on the receiver and target object and compare the results by `=`
- `compareAll:` it's like `compare:` but receives a collection of selectors or blocks.
- `compareWith: block` receives a two argument block and will add a rule to the checker that evaluates that block with the receiver and target objects. It expects that `block` evaluates to a `Boolean`.

The property based equality checker has always an implicit rule checking first if the target object is of the same type of the receiver. You check all the configured rules by sending `checkAgainst:` to the checker with the target object.

Buoy also offers a `SequenceableCollectionEqualityChecker` that can be used to compare two sequenceable collections by sending to it the message `check:against:` with both collections. It will check that both collections are sequenceable and contains the same elements in the same order.

### Equality Checker Examples

This examples assumes that equalityChecker is not reimplemented.

```smalltalk
"Just type checking"
|checker|
checker :=  (Set with: 11) equalityChecker.
(checker checkAgainst: (Set with: 22)) >>> true.
(checker checkAgainst: #(11)) >>> false.
```

```smalltalk
| checker |
checker := 1 equalityChecker.
checker compare: #abs.
(checker checkAgainst: -1) >>> true.
(checker checkAgainst: 2) >>> false      
```

```smalltalk
| checker |
checker := (Set with: 34) equalityChecker.
checker compareWith: [:a :b | a asArray = b asArray].
(checker checkAgainst: (Set with: 34)) >>> true.
(checker checkAgainst: (Set with: 33)) >>> false.
```
