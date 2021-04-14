# Collections

## `Collection` extensions

- `maxUsing:` : Allows to get the maximum element in the collection following the provided criteria. It will fail if the collection is empty.
- `maxUsing:ifEmpty:` : Allows to get the maximum element in the collection following the provided criteria. It will evaluate the failBlock if the collection is empty.
- `minUsing:` : Allows to get the minimum element in the collection following the provided criteria. It will fail if the collection is empty.
- `minUsing:ifEmpty:` : Allows to get the minimum element in the collection following the provided criteria. It will evaluate the failBlock if the collection is empty.

Some examples

```smalltalk
#( #(1) #(3 1) #(2) ) maxUsing: [:array | array first ] >>> 3
#( #(1) #(3 1) #(2) ) minUsing: [:array | array first ] >>> 1
```

## `SequenceableCollection` extensions

- `copyFirst:` Copy the first `n` elements of the collection. If `n` is 0 it will return an empty collection. If `n` is greater than the collection size it will raise an Error.
- `copyLast:` Copy the last `n` elements of the collection. If `n` is 0 it will return an empty collection. If `n` is greater than the collection size it will raise an Error.
- `copyNoMoreThanFirst:` Copy at max the first `n` elements of the collection. If `n` is 0 it will return an empty collection. If `n` is greater than the collection size it will return the whole collection.
- `copyNoMoreThanLast:` Copy at max the last `n` elements of the collection. If `n` is 0 it will return an empty collection. If `n` is greater than the collection size it will return the whole collection.
- `withoutFirst` Copy the collection excluding the first element. If the collection is empty it will return an empty collection.
- `withoutFirst:` Copy the collection excluding the first `n` elements of it. If `n` is 0 it will return the same collection. If `n` is greater than the collection size it will return an empty collection.

Some examples

```smalltalk
#( a b c d e f ) copyFirst: 0 >>> #()
#( a b c d e f ) copyFirst: 3 >>> #( a b c )
#( a b c d e f ) copyFirst: 7 >>> Error

#( a b c d e f ) copyLast: 0 >>> #()
#( a b c d e f ) copyLast: 3 >>> #( d e f )
#( a b c d e f ) copyLast: 7 >>> Error

#( a b c d e f ) copyNoMoreThanFirst: 0 >>> #()
#( a b c d e f ) copyNoMoreThanFirst: 3 >>> #( a b c )
#( a b c d e f ) copyNoMoreThanFirst: 7 >>> #( a b c d e f )

#( a b c d e f ) copyNoMoreThanLast: 0 >>> #()
#( a b c d e f ) copyNoMoreThanLast: 3 >>> #( d e f )
#( a b c d e f ) copyNoMoreThanLast: 7 >>> #( a b c d e f )

#( a b c d e f ) withoutFirst >>> #(b c d e f)
#() withoutFirst >>> #()
#( a b c d e f ) withoutFirst: 0 >>> #( a b c d e f )
#( a b c d e f ) withoutFirst: 3 >>> #( d e f )
#( a b c d e f ) withoutFirst: 7 >>> #()

```

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

## Algorithms

### Binary Search

`BinarySearchAlgorithm` implements a [binary search](https://en.wikipedia.org/wiki/Binary_search_algorithm) operating on a collection previously sorted. Given a `search key` it will return the insertion index for it. It's useful as a building block for slicing collections with the provided properties in a given range, or inserting new elements in the proper place.

Let's see an example:

Suppose we have a collection holding some events including a creation date, and it's already sorted by it, and now be want to get the events created after some starting date and before or on another creation date. You can do it with:

```smalltalk
events
  select: [:event | startingDate < event creationDate  
                    and: [ event creationDate <= endDate ]]
```

Or using binary search like this:

```smalltalk
| lower upper |

lower :=
  (BinarySearchAlgorithm
    searchFor: startingDate
    in: events
    using: [:event | event creationDate ]    
  ) execute.

upper :=
  (BinarySearchAlgorithm
    searchFor: endDate
    in: events
    from: lower
    using: [:event | event creationDate]
    ) execute - 1.

^ upper < lower ifTrue: [ #() ] ifFalse: [ events copyFrom: lower to: upper ]
```

### Balanced distribution in buckets

`BalancedDistributionInBucketsAlgorithm` implements an algorithm that given a starting collection and a maximum bucket size will return a list of buckets (respecting the max bucket size) including all the collection elements distributed in the buckets in a balanced fashion (so no bucket will look almost empty).

For example:

```smalltalk
( BalancedDistributionInBucketsAlgorithm
  distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 )
  maxPerBucket: 4 ) execute.
```

will produce 7 buckets:

```smalltalk
#( 1 2 3 4)
#( 5 6 7 8)
#( 9 10 11 12)
#( 13 14 15 16)
#( 17 18 19)
#( 20 21 22)
#( 23 24 25)
```
