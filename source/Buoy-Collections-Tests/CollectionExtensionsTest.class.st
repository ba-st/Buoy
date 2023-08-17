"
I'm a test case for extensions to the collection hierarchy
"
Class {
	#name : #CollectionExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testComma [

	self
		assert: #( 1 2 3 4 ) , #( 5 6 ) equals: #( 1 2 3 4 5 6 );
		assert: #( 1 2 3 4 ) asSet , #( 2 5 ) equals: #( 1 2 3 4 5 ) asSet
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyFirst [

	self
		assert: ( #(a b c d e f) copyFirst: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyFirst: 2 ) equals: #(a b);
		assert: ( #(a b c d e f) copyFirst: 6 ) equals: #(a b c d e f).

	self should: [ #(a b c d e f) copyFirst: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyLast [

	self
		assert: ( #(a b c d e f) copyLast: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyLast: 2 ) equals: #(e f);
		assert: ( #(a b c d e f) copyLast: 6 ) equals: #(a b c d e f).

	self should: [ #(a b c d e f) copyLast: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanFirst [

	self
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 2 ) equals: #(a b);
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 6 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 20 ) equals: #(a b c d e f)
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanLast [

	self
		assert: ( #(a b c d e f) copyNoMoreThanLast: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyNoMoreThanLast: 2 ) equals: #(e f);
		assert: ( #(a b c d e f) copyNoMoreThanLast: 6 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) copyNoMoreThanLast: 20 ) equals: #(a b c d e f)

]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundIfNoneWhenNobodyIsFound [

	| wasFound |
	wasFound := #( 1 2 3 )
		            detect: [ :each | each isNil ]
		            ifFound: [ true ]
		            ifNone: [ false ].
	self deny: wasFound
]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundIfNoneWhenSomethingIsFound [

	| wasFound |
	wasFound := #( 1 2 3 )
		            detect: [ :each | each notNil ]
		            ifFound: [ :found |
			            self assert: found equals: 1.
			            true ]
		            ifNone: [ false ].
	self assert: wasFound
]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [

	| wasFound |
	wasFound := #( 1 2 3 )
		            detect: [ :each | each notNil ]
		            ifFound: [ true ]
		            ifNone: [ false ].
	self assert: wasFound
]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundWhenNobodyIsFound [

	| collection result |
	collection := #( a b c ).
	result := collection detect: #isNil ifFound: [ self fail ].
	self assert: result identicalTo: collection
]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundWhenSomethingIsFound [

	| collection result wasFound |
	wasFound := false.
	collection := #( $a $b $e ).
	result := collection detect: #isVowel ifFound: [ :vowel |
		          self assert: vowel equals: $a.
		          wasFound := true ].
	self
		assert: wasFound;
		assert: result identicalTo: collection
]

{ #category : #tests }
CollectionExtensionsTest >> testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [

	| wasFound |
	wasFound := false.
	#( $a $b )
		detect: [ :each | each notNil ]
		ifFound: [ wasFound := true ].
	self assert: wasFound
]

{ #category : #tests }
CollectionExtensionsTest >> testIfEmptyIfNotEmptyWhenEmpty [

	| isEmpty |
	isEmpty := false.
	#(  ) ifEmpty: [ isEmpty := true ] ifNotEmpty: [ self fail ].
	self assert: isEmpty
]

{ #category : #tests }
CollectionExtensionsTest >> testIfEmptyIfNotEmptyWhenNotEmpty [

	| isNotEmpty |
	isNotEmpty := false.
	#( 1 ) ifEmpty: [ self fail ] ifNotEmpty: [ isNotEmpty := true ].
	self assert: isNotEmpty
]

{ #category : #tests }
CollectionExtensionsTest >> testIfEmptyIfNotEmptyWhenNotEmptyUsingNotEmptyValue [

	| isNotEmpty |
	isNotEmpty := false.
	#( 1 ) ifEmpty: [ self fail ] ifNotEmpty: [ :collection |
		self assert: collection equals: #( 1 ).
		isNotEmpty := true ].
	self assert: isNotEmpty
]

{ #category : #tests }
CollectionExtensionsTest >> testMaxUsing [

	self assert: ( #(#(1) #(3 1) #(2)) maxUsing: [ :anArray | anArray first ] ) equals: 3.
	
	self should: [ #() maxUsing: [ :anArray | anArray first ] ] raise: Error
]

{ #category : #tests }
CollectionExtensionsTest >> testMinUsing [

	self assert: ( #(#(3 1) #(1) #(2)) minUsing: [ :anArray | anArray first ] ) equals: 1.
	self should: [ #() minUsing: [ :anArray | anArray first ] ] raise: Error
]

{ #category : #tests }
CollectionExtensionsTest >> testRemoveAll [

	{ Set. OrderedCollection. Bag } do: [ :collectionClass |
		| collection |
		collection := collectionClass withAll: #( 1 2 3 1 ).
		self assert: collection notEmpty.
		collection removeAll.
		self assert: collection isEmpty ]
]

{ #category : #tests }
CollectionExtensionsTest >> testSelectThenCollectOnBag [

	| numbers evenDoubles |
	numbers := Bag withAll: #( 3 2 12 2 16 ).
	evenDoubles := numbers
		               select: [ :each | each even ]
		               thenCollect: [ :each | each * 2 ].
	self assert: evenDoubles equals: (Bag withAll: #( 4 4 24 32 ))
]

{ #category : #tests }
CollectionExtensionsTest >> testSelectThenCollectOnOrderedCollection [

	| numbers evenDoubles |
	numbers := OrderedCollection withAll: #( 3 2 12 2 16 ).
	evenDoubles := numbers
		               select: [ :each | each even ]
		               thenCollect: [ :each | each * 2 ].
	self
		assert: evenDoubles
		equals: (OrderedCollection withAll: #( 4 24 4 32 ))
]

{ #category : #tests }
CollectionExtensionsTest >> testSelectThenCollectOnSet [

	| numbers evenDoubles |
	numbers := Set withAll: #( 3 2 12 2 16 ).
	evenDoubles := numbers
		               select: [ :each | each even ]
		               thenCollect: [ :each | each * 2 ].
	self assert: evenDoubles equals: (Set withAll: #( 4 24 32 ))
]

{ #category : #tests }
CollectionExtensionsTest >> testWithIndexCollect [

	| numbers scaledNumbers |
	numbers := #( 3 2 12 2 16 ).
	scaledNumbers := numbers withIndexCollect: [ :each :index |
		                 each * index ].
	self
		assert: scaledNumbers
		hasTheSameElementsInTheSameOrderThat: #( 3 4 36 8 80 )
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testWithoutFirst [

	self
		assert: #(a b c d e f) withoutFirst equals: #(b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 0 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 1 ) equals: #(b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 2 ) equals: #(c d e f);
		assert: ( #(a b c d e f) withoutFirst: 6 ) isEmpty;
		assert: ( #(a b c d e f) withoutFirst: 20 ) isEmpty
]
