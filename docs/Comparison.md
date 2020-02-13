# Comparison

This package includes classes to comparing objects both for equality and for identity. They are typically used to implement the `=` and `hash` methods.

## `ExclusiveLogicalOr` 
It builds an exclusive or with all arguments. There are three ways of using it: 
- `ofAll:` : it execute a `bitXor:` of each element. It will fail if the collection is empty.
- `ofHashesOfAll::` : it execute a hash and then `bitXor:` of each element. It will fail if the collection is empty.
- `collecting: aBlock ofAll: anObjectCollection` : it collects the `aBlock:` of all elements and then execute a `bitor:` of each element. It will fail if the collection is empty.

Some examples

```smalltalk
 ExclusiveLogicalOr ofAll: #(2 5 6)  >>>  ( ( 2 bitXor: 5 ) bitXor: 6 )
 ExclusiveLogicalOr ofAll: #(100 0 4 50) >>> ( ( ( 100 bitXor: 50 ) bitXor: 4 ) bitXor: 0 )
 
 ExclusiveLogicalOr collecting: #hash ofAll: #('alpha' 'beta' 'gamma') >>> (( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash )
 ExclusiveLogicalOr ofHashesOfAll: #('alpha' 'beta' 'gamma') >>> (( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash ) 
```

## `StandardComparison`
It eases the implementation of comparison for equality of objects. Comparison instance can be build in different ways:

- `StandardComparison differentiatingType`: it will only compare `==` or if an object isKindOf anotherObject. 
- `StandardComparison differentiatingSending: aSelectorsCollection`: it will compare `==` or if an object isKindOf anotherObject. Then evaluate comparison of all selectors of boths objects.
- `StandardComparison differentiatingThrough: aBlock`: it will compare `==` or if an object isKindOf anotherObject. Then evaluate comparison using aBlock of boths objects.

Some examples

```smalltalk
|comparison|
comparison := StandardComparison differentiatingType.
comparison check: (Set with: 11) against: (Set with: 22) >>> true.
comparison check: (Set with: 11) against: (OrderedCollection with: 22) >>> false.
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
