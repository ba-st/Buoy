# Comparison

This package includes classes to compare objects both for equality and identity. They are typically used to implement the `=` and `hash` methods.

## `ExclusiveLogicalOr` 
It builds an exclusive or between all its arguments. There are three ways of using it: 
- `ofAll:` : executes a `bitXor:` iterating over the elements. It will fail if the collection is empty.
- `ofHashesOfAll::` : executes a hash and then `bitXor:` iterating over the elements. It will fail if the collection is empty.
- `collecting: aBlock ofAll: anObjectCollection` : collects the `aBlock:` of all elements and then executes `bitXor:` iterating over the results. It will fail if the collection is empty.

Some examples

```smalltalk
 ExclusiveLogicalOr ofAll: #(2 5 6)  >>>  ( ( 2 bitXor: 5 ) bitXor: 6 )
 ExclusiveLogicalOr ofAll: #(100 0 4 50) >>> ( ( ( 100 bitXor: 50 ) bitXor: 4 ) bitXor: 0 )
 
 ExclusiveLogicalOr collecting: #hash ofAll: #('alpha' 'beta' 'gamma') >>> (( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash )
 ExclusiveLogicalOr ofHashesOfAll: #('alpha' 'beta' 'gamma') >>> (( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash ) 
```

## `StandardComparison`
It eases the implementation of comparison for equality of objects. Instances can be built in different ways:

- `StandardComparison differentiatingType`: compares for identity (`==`) or if an object `isKindOf` anotherObject. 
- `StandardComparison differentiatingSending: aSelectorsCollection`: compares for identity (`==`), or if an object `isKindOf` anotherObject and all selectors are equal for both objects.
- `StandardComparison differentiatingThrough: aBlock`: compares for identity (`==`), or if an object `isKindOf` anotherObject and the block returns true when applied to both objects.

Some examples

```smalltalk
|comparison|
comparison := StandardComparison differentiatingType.
comparison check: (Set with: 11) against: (Set with: 22) >>> true.
comparison check: (Set with: 11) against: (OrderedCollection with: 11) >>> false.
```

```
| comparison |
comparison := StandardComparison differentiatingSending: #(asArray).
comparison check: (Set with: 34) against: (Set with: 34) >>> true.

```

```
| comparison |

comparison :=
StandardComparison differentiatingThrough: [:oneObject :anotherObject |
oneObject asArray = anotherObject asArray].

comparison check: (Set with: 34) against: (Set with: 34) >>> true.
```
