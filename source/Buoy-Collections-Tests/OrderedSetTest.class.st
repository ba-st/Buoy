"
An OrderedSetTest is a test class for testing the behavior of OrderedSet
"
Class {
	#name : #OrderedSetTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #private }
OrderedSetTest >> abcSet [

	^ OrderedSet with: $a with: $b with: $c
]

{ #category : #private }
OrderedSetTest >> cdeSet [

	^ OrderedSet with: $c with: $d with: $e
]

{ #category : #private }
OrderedSetTest >> newEmptySet [

	^ OrderedSet new
]

{ #category : #private }
OrderedSetTest >> newOrderedSetWithTwoElements [

	^ OrderedSet with: 1 with: 2 with: 2
]

{ #category : #'tests - adding' }
OrderedSetTest >> testAdd [

	| set |

	set := self newEmptySet.
	self assert: set isEmpty.
	self should: [ set at: 1 ] raise: SubscriptOutOfBounds.

	set add: $a.
	self assert: ( set at: 1 ) equals: $a.
	self should: [ set at: 2 ] raise: SubscriptOutOfBounds.

	set add: $a.
	self assert: ( set at: 1 ) equals: $a.
	self should: [ set at: 2 ] raise: SubscriptOutOfBounds.

	set add: $b.
	self assert: ( set at: 1 ) equals: $a.
	self assert: ( set at: 2 ) equals: $b.
	self should: [ set at: 3 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests - adding' }
OrderedSetTest >> testAddAll [

	| set |

	set := self newEmptySet.

	set addAll: #( 1 2 1 4 3 1 2 ).

	self
		assert: set size equals: 4;
		assert: set hasTheSameElementsInTheSameOrderThat: #( 1 2 4 3 )
]

{ #category : #'tests - testing' }
OrderedSetTest >> testAllSatisfy [

	| set |

	set := self newOrderedSetWithTwoElements.

	self
		assert: ( set allSatisfy: #notNil );
		deny: ( set allSatisfy: [ :element | element = set first ] )
]

{ #category : #'tests - adding' }
OrderedSetTest >> testAllowsNil [

	| set |

	set := self newEmptySet.
	self assert: set isEmpty.
	self should: [ set at: 1 ] raise: SubscriptOutOfBounds.

	set add: nil.
	self assert: ( set at: 1 ) isNil.
	self should: [ set at: 2 ] raise: SubscriptOutOfBounds.

	set add: nil.
	self assert: ( set at: 1 ) isNil.
	self should: [ set at: 2 ] raise: SubscriptOutOfBounds.

	set := OrderedSet with: nil.
	set at: 1 put: nil.
	self assert: set first isNil.
	self should: [ set at: 2 put: nil ] raise: ConflictingObjectFound
]

{ #category : #'tests - adding' }
OrderedSetTest >> testAnyOne [

	| set |

	set := self newEmptySet.
	self should: [ set anyOne ] raise: SubscriptOutOfBounds.

	set add: $a.
	self assert: set anyOne equals: $a.

	set add: $b.
	self assert: set anyOne equals: $a.

	set remove: $a.
	self assert: set anyOne equals: $b
]

{ #category : #'tests - testing' }
OrderedSetTest >> testAnySatisfy [

	| set |

	set := self newOrderedSetWithTwoElements.

	self
		assert: ( set anySatisfy: #notNil );
		assert: ( set anySatisfy: [ :element | element = set last ] );
		deny: ( set anySatisfy: #isNil )
]

{ #category : #'tests - converting' }
OrderedSetTest >> testAsArray [

	| collection |

	collection := self newOrderedSetWithTwoElements asArray.
	self
		assert: collection species equals: Array;
		assert: collection size equals: 2;
		assert: collection first equals: 1;
		assert: collection second equals: 2
]

{ #category : #'tests - converting' }
OrderedSetTest >> testAsOrderedCollection [

	| collection |

	collection := self newOrderedSetWithTwoElements asOrderedCollection.
	self
		assert: collection species equals: OrderedCollection;
		assert: collection size equals: 2;
		assert: collection first equals: 1;
		assert: collection second equals: 2.

	collection add: 2.

	self
		assert: collection size equals: 3;
		assert: collection last equals: 2
]

{ #category : #'tests - converting' }
OrderedSetTest >> testAsOrderedSet [

	| orderedSet |

	orderedSet := self newEmptySet.
	self assert: orderedSet identicalTo: orderedSet asOrderedSet.

	orderedSet := OrderedSet with: 1 with: 2.
	{ 
		( OrderedCollection with: 1 with: 2 ).
		( Set with: 1 with: 2 ).
		#( 1 2 1 ) } do: [ :collection | 
		self
			assert: ( collection asOrderedSet isKindOf: OrderedSet );
			assert: collection asOrderedSet equals: orderedSet;
			assert: orderedSet equals: collection asOrderedSet
		]
]

{ #category : #'tests - converting' }
OrderedSetTest >> testAsSet [

	| collection |

	collection := self newOrderedSetWithTwoElements asSet.
	self
		assert: collection species equals: Set;
		assert: collection size equals: 2;
		assert: collection includes: 1;
		assert: collection includes: 2.

	collection add: 2.

	self assert: collection size equals: 2
]

{ #category : #'tests - converting' }
OrderedSetTest >> testAsSortedCollection [

	| collection |

	collection := ( OrderedSet with: 2 with: 1 with: 0 ) asSortedCollection.
	self
		assert: collection species equals: SortedCollection;
		assert: collection size equals: 3;
		assert: collection first equals: 0;
		assert: collection second equals: 1;
		assert: collection third equals: 2
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testAt [

	| set |

	set := self newEmptySet.

	self should: [ set at: 1 ] raise: SubscriptOutOfBounds.

	set add: $a.
	self assert: ( set at: 1 ) equals: $a.
	self should: [ set at: 2 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testAtPut [

	| set |

	set := OrderedSet with: 1 with: 3.
	set at: 1 put: 2.
	self assert: set first equals: 2.
	self should: [ set at: 1 put: 3 ] raise: ConflictingObjectFound
]

{ #category : #'tests - testing' }
OrderedSetTest >> testBeginsWith [

	self
		assert: ( self abcSet beginsWith: 'ab' );
		deny: ( self abcSet beginsWith: 'ac' )
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testCollect [

	| set |

	set := self abcSet.

	self assert: ( set collect: #isVowel ) equals: ( OrderedSet with: true with: false )
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testCollectAs [

	| set |

	set := self abcSet.

	self assert: ( set collect: #isVowel as: Array ) equals: #( true false false )
]

{ #category : #'tests - comparing' }
OrderedSetTest >> testComparing [

	| set1 set2 |

	set1 := self abcSet.

	set2 := self abcSet.

	self assert: set1 equals: set2.
	self assert: set1 hash equals: set2 hash.

	set1 := OrderedSet with: $a with: $c with: $b.
	set2 := self abcSet.

	self deny: set1 equals: set2.

	self deny: set1 equals: 8
]

{ #category : #'tests - copying' }
OrderedSetTest >> testConcatenation [

	| set secondSet thirdSet concatenation concatenationWithRepetitions |

	set := OrderedSet with: $a with: $b.

	secondSet := OrderedSet with: $c.
	concatenation := set , secondSet.
	self
		assert: concatenation size equals: 3;
		assert: concatenation hasTheSameElementsInTheSameOrderThat: 'abc';
		assert: set size equals: 2.

	thirdSet := OrderedSet with: $a.
	concatenationWithRepetitions := set , thirdSet.
	self
		assert: concatenationWithRepetitions hasTheSameElementsInTheSameOrderThat: set;
		assert: set size equals: 2
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyAfter [

	| original copy |

	original := self abcSet.

	copy := original copyAfter: $b.

	self
		assert: copy size equals: 1;
		assert: copy last equals: $c
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyAfterLast [

	| original copy |

	original := self abcSet.

	copy := original copyAfterLast: $b.

	self
		assert: copy size equals: 1;
		assert: copy last equals: $c
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyFirst [

	| original copy |

	original := self abcSet.

	copy := original copyFirst: 2.

	self
		assert: copy size equals: 2;
		assert: copy first equals: $a;
		assert: copy last equals: $b
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyFromTo [

	| original copy |

	original := self abcSet.

	copy := original copyFrom: 2 to: 2.

	self
		assert: copy size equals: 1;
		assert: copy last equals: $b.

	self should: [ copy copyFrom: 2 to: 3 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyLast [

	| original copy |

	original := self abcSet.

	copy := original copyLast: 2.

	self
		assert: copy size equals: 2;
		assert: copy first equals: $b;
		assert: copy last equals: $c
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyNoMoreThanFirst [

	| original copy |

	original := self abcSet.

	copy := original copyNoMoreThanFirst: 2.

	self
		assert: copy size equals: 2;
		assert: copy first equals: $a;
		assert: copy last equals: $b.

	self assert: ( original copyNoMoreThanFirst: 8 ) equals: original
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyNoMoreThanLast [

	| original copy |

	original := self abcSet.

	copy := original copyNoMoreThanLast: 2.

	self
		assert: copy size equals: 2;
		assert: copy first equals: $b;
		assert: copy last equals: $c.

	self assert: ( original copyNoMoreThanLast: 8 ) equals: original
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyReplaceAllWith [

	| original copy |

	original := self abcSet.

	copy := original copyReplaceAll: 'ab' with: 'de'.

	self
		assert: copy size equals: 3;
		assert: copy first equals: $d;
		assert: copy second equals: $e;
		assert: copy last equals: $c.

	copy := original copyReplaceAll: 'ab' with: 'cc'.

	self withTheOnlyOneIn: copy do: [ :letter | self assert: letter equals: $c ]
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyReplaceFromToWith [

	| original copy |

	original := self abcSet.

	copy := original copyReplaceFrom: 1 to: 2 with: 'de'.

	self
		assert: copy size equals: 3;
		assert: copy first equals: $d;
		assert: copy second equals: $e;
		assert: copy last equals: $c.

	copy := original copyReplaceFrom: 1 to: 2 with: 'cc'.

	self withTheOnlyOneIn: copy do: [ :letter | self assert: letter equals: $c ]
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyReplaceFromToWithInsertingAtEnd [

	| original copy |

	original := self abcSet.

	copy := original copyReplaceFrom: 4 to: 3 with: 'f'.

	self
		assert: copy size equals: 4;
		assert: copy first equals: $a;
		assert: copy second equals: $b;
		assert: copy third equals: $c;
		assert: copy last equals: $f
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyReplaceFromToWithInsertingAtFront [

	| original copy |

	original := self abcSet.

	copy := original copyReplaceFrom: 1 to: 0 with: 'f'.

	self
		assert: copy size equals: 4;
		assert: copy first equals: $f;
		assert: copy second equals: $a;
		assert: copy third equals: $b;
		assert: copy last equals: $c
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyReplaceFromToWithOutOfBounds [

	self should: [ self abcSet copyReplaceFrom: 1 to: 8 with: 'de' ] raise: SubscriptOutOfBounds
]

{ #category : #'tests - copying' }
OrderedSetTest >> testCopyWith [

	| original copy copyWithRepetitions |

	original := OrderedSet with: $a with: $b.

	copy := original copyWith: $c.

	self
		assert: copy size equals: 3;
		assert: copy last equals: $c.

	copyWithRepetitions := original copyWith: $a.
	self
		assert: copyWithRepetitions size equals: 2;
		assert: copyWithRepetitions first equals: $a;
		assert: copyWithRepetitions last equals: $b
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testCount [

	| set |

	set := self abcSet.

	self assert: ( set count: #isVowel ) equals: 1
]

{ #category : #'tests - instance creation' }
OrderedSetTest >> testCreation [

	| set |

	set := self newEmptySet.
	self assert: set size equals: 0.
	set := OrderedSet new: 4.
	self assert: set size equals: 0
]

{ #category : #'tests - copying' }
OrderedSetTest >> testDeepCopy [

	| original copy |

	original := OrderedSet with: 'a' with: 'b'.
	copy := original deepCopy.
	self assert: original equals: copy.
	self deny: original identicalTo: copy.

	original with: copy do: [ :eachOriginal :eachCopy | 
		self assert: eachOriginal equals: eachCopy.
		self deny: eachOriginal identicalTo: eachCopy
		]
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDetect [

	| set |

	set := self abcSet.

	self
		assert: ( set detect: #isVowel ) equals: $a;
		should: [ set detect: #isDigit ] raise: NotFound
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDetectIfFound [

	| set wasFound |

	set := self abcSet.

	wasFound := false.
	set detect: #isVowel ifFound: [ :vowel | 
		wasFound := true.
		self assert: vowel equals: $a
		].
	self assert: wasFound.

	set detect: #isDigit ifFound: [ self fail ]
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDetectIfFoundIfNone [

	| set |

	set := self abcSet.

	self assert: ( set detect: #isVowel ifFound: [ :vowel | vowel ] ifNone: [ self fail ] ) equals: $a.
	self assert: ( set detect: #isDigit ifFound: [ self fail ] ifNone: [ $x ] ) equals: $x
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDetectIfNone [

	| set notFound |

	set := self abcSet.

	self assert: ( set detect: #isVowel ifNone: [ self fail ] ) equals: $a.

	notFound := false.
	set detect: #isDigit ifNone: [ notFound := true ].

	self assert: notFound
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDifference [

	| difference |

	difference := self abcSet difference: self newEmptySet.

	self assert: difference equals: self abcSet.

	difference := self abcSet difference: self abcSet.

	self assert: difference isEmpty.

	difference := self abcSet difference: self abcSet withoutFirst.

	self withTheOnlyOneIn: difference do: [ :letter | self assert: letter equals: $a ]
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDo [

	self assert:
		( String streamContents: [ :stream | self abcSet do: [ :each | stream nextPut: each ] ] )
		equals: 'abc'
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDoSeparatedBy [

	self
		assert: ( String streamContents: [ :stream | 
				  self abcSet do: [ :each | stream nextPut: each ] separatedBy: [ stream space ] ] )
		equals: 'a b c'
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testDoWithIndex [

	self
		assert: ( String streamContents: [ :stream | 
				  self abcSet doWithIndex: [ :each :index | 
					  stream
						  print: index;
						  nextPut: each
					  ]
				  ] )
		equals: '1a2b3c'
]

{ #category : #'tests - testing' }
OrderedSetTest >> testEndsWith [

	self
		assert: ( self abcSet endsWith: 'bc' );
		deny: ( self abcSet endsWith: 'ac' )
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testFirst [

	| set |

	set := self newEmptySet.
	self should: [ set first ] raise: SubscriptOutOfBounds.
	set add: $a.
	self assert: set first equals: $a.
	set add: $b.
	self assert: set first equals: $a
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIfEmpty [

	| isEmpty |

	self abcSet ifEmpty: [ self fail ].
	isEmpty := false.
	self newEmptySet ifEmpty: [ isEmpty := true ].
	self assert: isEmpty
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIfEmptyIfNotEmpty [

	| isEmpty notEmpty |

	notEmpty := false.
	self abcSet ifEmpty: [ self fail ] ifNotEmpty: [ :set | 
		self assert: set size equals: 3.
		notEmpty := true
		].
	self assert: notEmpty.

	isEmpty := false.
	self newEmptySet ifEmpty: [ isEmpty := true ] ifNotEmpty: [ self fail ].
	self assert: isEmpty
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIfNotEmpty [

	| notEmpty |

	self newEmptySet ifNotEmpty: [ self fail ].
	notEmpty := false.
	self abcSet ifNotEmpty: [ notEmpty := true ].
	self assert: notEmpty
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIncludes [

	| set |

	set := self newEmptySet.
	self deny: ( set includes: $a ).
	set add: $a.
	self assert: set includes: $a.
	self deny: ( set includes: $b )
]

{ #category : #'tests - adding' }
OrderedSetTest >> testIndexOf [

	| set |

	set := self newEmptySet.

	self assert: ( set indexOf: $a ) equals: 0.

	set
		add: $a;
		add: $b;
		add: $a.

	self
		assert: ( set indexOf: $a ) equals: 1;
		assert: ( set indexOf: $b ) equals: 2;
		assert: ( set indexOf: $c ) equals: 0
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testInjectInto [

	self assert: ( self abcSet inject: 0 into: [ :sum :current | sum + current codePoint ] )
		equals: 294
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testIntersection [

	| intersection |

	intersection := self abcSet intersection: self newEmptySet.

	self assert: intersection isEmpty.

	intersection := self abcSet intersection: self abcSet.

	self assert: intersection equals: self abcSet.

	intersection := self abcSet intersection: self abcSet withoutFirst.

	self
		assert: intersection size equals: 2;
		assert: intersection first equals: $b;
		assert: intersection last equals: $c
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIsCollection [

	self assert: self newEmptySet isCollection
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIsEmpty [

	self
		assert: self newEmptySet isEmpty;
		deny: self abcSet isEmpty
]

{ #category : #'tests - testing' }
OrderedSetTest >> testIsSequenceable [

	self assert: self newEmptySet isSequenceable
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testLast [

	| set |

	set := self newEmptySet.
	self should: [ set last ] raise: SubscriptOutOfBounds.
	set add: $a.
	self assert: set last equals: $a.
	set add: $b.
	self assert: set last equals: $b
]

{ #category : #'tests - testing' }
OrderedSetTest >> testNotEmpty [

	self
		deny: self newEmptySet notEmpty;
		assert: self abcSet notEmpty
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testOccurrencesOf [

	self
		assert: ( self abcSet occurrencesOf: $a ) equals: 1;
		assert: ( self abcSet occurrencesOf: $c ) equals: 1;
		assert: ( self abcSet occurrencesOf: $d ) equals: 0
]

{ #category : #'tests - converting' }
OrderedSetTest >> testReadStream [

	| set stream |

	set := self abcSet.
	stream := set readStream.

	self
		deny: stream atEnd;
		assert: stream next equals: $a;
		assert: stream next equals: $b;
		assert: stream next equals: $c;
		assert: stream atEnd
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testReject [

	| set |

	set := self abcSet.

	self assert: ( set reject: #isCharacter ) isEmpty.

	self assert: ( set reject: [ :each | each = $b ] )
		hasTheSameElementsInTheSameOrderThat: ( OrderedSet with: $a with: $c )
]

{ #category : #'tests - removing' }
OrderedSetTest >> testRemove [

	| set acSet |

	set := self abcSet.
	acSet := OrderedSet with: $a with: $c.
	set remove: $b.

	self assert: set hasTheSameElementsInTheSameOrderThat: acSet.

	self should: [ set remove: $b ] raise: NotFound
]

{ #category : #'tests - removing' }
OrderedSetTest >> testRemoveAll [

	| set |

	set := self abcSet.
	set removeAll.

	self assert: set isEmpty
]

{ #category : #'tests - removing' }
OrderedSetTest >> testRemoveAllInOtherCollection [

	| set |

	set := self abcSet.
	set removeAll: 'ac'.

	self withTheOnlyOneIn: set do: [ :theOne | self assert: theOne equals: $b ]
]

{ #category : #'tests - removing' }
OrderedSetTest >> testRemoveIfAbsent [

	| set acSet |

	set := self abcSet.
	acSet := OrderedSet with: $a with: $c.
	set remove: $b ifAbsent: [ self fail ].

	self assert: set hasTheSameElementsInTheSameOrderThat: acSet.
	self should: [ set remove: $b ifAbsent: [ ObjectNotFound signal: '$b not found.' ] ]
		raise: ObjectNotFound
		withMessageText: '$b not found.'
]

{ #category : #'tests - converting' }
OrderedSetTest >> testReverse [

	| set reverseSet |

	set := self abcSet.
	reverseSet := OrderedSet with: $c with: $b with: $a.
	self assert: set reverse equals: reverseSet
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testReverseDo [

	self
		assert: ( String streamContents: [ :stream | 
				  | set |

				  set := self abcSet.
				  set reverseDo: [ :each | stream nextPut: each ]
				  ] )
		equals: 'cba'
]

{ #category : #'tests - converting' }
OrderedSetTest >> testReversed [

	| set reverseSet |

	set := self abcSet.
	reverseSet := OrderedSet with: $c with: $b with: $a.
	self assert: set reversed equals: reverseSet
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testSelect [

	| set |

	set := self abcSet.

	self
		assert: ( set select: #isNumber ) isEmpty;
		assert: ( set select: [ :each | each = $b ] ) equals: ( OrderedSet with: $b )
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testSelectThenCollect [

	| numbers evenDoubles |

	numbers := OrderedSet withAll: #( 3 2 12 2 3 16 ).

	evenDoubles := numbers select: [ :each | each even ] thenCollect: [ :each | each * 2 ].

	self assert: evenDoubles equals: ( OrderedSet withAll: #( 4 24 32 ) )
]

{ #category : #'tests - copying' }
OrderedSetTest >> testShallowCopy [

	| original copy |

	original := OrderedSet with: 'a' with: 'b'.

	copy := original shallowCopy.

	self assert: original equals: copy.

	self deny: original identicalTo: copy.

	original with: copy do: [ :eachOriginal :eachCopy | 
		self assert: eachOriginal equals: eachCopy.
		self assert: eachOriginal identicalTo: eachCopy
		]
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testSize [

	| set |

	set := self newEmptySet.
	self assert: set size equals: 0.
	set add: $a.
	self assert: set size equals: 1.
	set add: $b.
	self assert: set size equals: 2.
	set remove: $a.
	self assert: set size equals: 1
]

{ #category : #'tests - accessing' }
OrderedSetTest >> testSpecies [

	self assert: self newEmptySet species equals: OrderedSet
]

{ #category : #'tests - adding' }
OrderedSetTest >> testSwapWith [

	| set |

	set := self newEmptySet.

	set
		add: $a;
		add: $b.

	set swap: 1 with: 2.

	self
		assert: set first equals: $b;
		assert: set last equals: $a
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testUnion [

	| union |

	union := self abcSet union: self newEmptySet.

	self assert: union equals: self abcSet.

	union := self abcSet union: self abcSet.

	self assert: union equals: self abcSet.

	union := self abcSet union: self cdeSet.

	self
		assert: union size equals: 5;
		assert: union equals: 'abcde' asOrderedSet
]

{ #category : #'tests - instance creation' }
OrderedSetTest >> testWithAll [

	| set |

	set := OrderedSet withAll: #( a c b a ).

	self assert: set hasTheSameElementsInTheSameOrderThat: #( a c b ).

	set := OrderedSet withAll: #( a nil b nil )		.

	self assert: set hasTheSameElementsInTheSameOrderThat: #( a nil b )
]

{ #category : #'tests - enumerating' }
OrderedSetTest >> testWithDo [

	| count |

	count := 0.
	self abcSet with: 'abc' do: [ :setElement :stringElement | 
		self assert: setElement equals: stringElement.
		count := count + 1
		].

	self assert: count equals: 3
]

{ #category : #'tests - copying' }
OrderedSetTest >> testWithoutFirst [

	| original copy |

	original := self abcSet.

	copy := original withoutFirst.

	self
		assert: copy size equals: 2;
		assert: copy first equals: $b;
		assert: copy last equals: $c.

	copy := original withoutFirst: 2.

	self
		assert: copy size equals: 1;
		assert: copy first equals: $c
]

{ #category : #'tests - converting' }
OrderedSetTest >> testWriteStream [

	| set stream |

	set := self abcSet.
	stream := set writeStream.

	stream
		nextPut: $d;
		nextPut: $e;
		nextPut: $f.
		
	"According to ANSI standard it is unspecified whether or not the
	returned collection is the same object as the backing store collection.
	
	Se we just test over the stream contents"
	
	self
		assert: stream contents size equals: 3;
		assert: stream contents first equals: $d;
		assert: stream contents second equals: $e;
		assert: stream contents last equals: $f.

	stream nextPut: $g.

	self
		assert: stream contents size equals: 4;
		assert: stream contents first equals: $d;
		assert: stream contents second equals: $e;
		assert: stream contents third equals: $f;
		assert: stream contents last equals: $g
]
