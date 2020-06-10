# Comparison

This package includes classes to ease the comparison of objects both for equality and identity. They are typically used to implement the `=` and `hash` methods.

## Hash Combinators
Hash combinators help to implement the `hash` or `identityHash` methods by providing an easy way to combine hashes. Any object can send to itself the `equalityHashCombinator` message and then use it to calculate the combined hash value. The default equality hash combinator uses bitXor operations, but any object can override this default behavior and provide a more specific policy.

It will apply the combinator operator to each one of the objects:
- `combineHashesOfAll:` will send the hash message to every object in the collection and then combine them.
- `combineHashOf:with:` will send the hash message to the two objects and then combine them.
- `combineAll::` expectes a collection of hashes and will combine them.
- `combine:with:` will combine two hash values

### Examples

```smalltalk
hash

  ^ self equalityHashCombinator combineAll: #(2 5 6)

hash

  ^ self equalityHashCombinator combineHashesOfAll: { alpha. beta. gamma }
```

## `StandardComparator`
It eases the implementation of comparison for equality of objects. Instances can be built in different ways:

- `StandardComparator differentiatingType`: compares for identity (`==`) or if an object `isKindOf` anotherObject.
- `StandardComparator differentiatingSending: aSelectorsCollection`: compares for identity (`==`), or if an object `isKindOf` anotherObject and all selectors are equal for both objects.
- `StandardComparator differentiatingThrough: aBlock`: compares for identity (`==`), or if an object `isKindOf` anotherObject and the block returns true when applied to both objects.

Some examples

```smalltalk
|comparator|
comparator := StandardComparator differentiatingType.
comparator check: (Set with: 11) against: (Set with: 22) >>> true.
comparator check: (Set with: 11) against: (OrderedCollection with: 11) >>> false.
```

```smalltalk
| comparator |
comparator := StandardComparator differentiatingSending: #(abs).
comparator check: 1 against: -1 >>> true.
comparator check: 1 against: 2 >>> false.
```

```smalltalk
| comparator |

comparator :=
StandardComparator differentiatingThrough: [:oneObject :anotherObject |
oneObject asArray = anotherObject asArray].

comparator check: (Set with: 34) against: (Set with: 34) >>> true.
comparator check: (Set with: 34) against: (Set with: 33) >>> false.
```
