"
This class tests the OrderedDictionary class. It is separate from DictionaryTest to test that accessing, enumerating, and printing methods preserve the order that keys were inserted in.
"
Class {
	#name : #OrderedDictionaryExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'nonIdentityOrderedAssociations',
		'identityOrderedAssociations'
	],
	#category : #'Buoy-Collections-Tests'
}

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> absentKey [

	^self isTestingIdentityDictionary
		ifTrue: [ self identityAbsentKey ]
		ifFalse: [ self nonIdentityAbsentKey ]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> absentValue [
	^ 'absentValue'
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertDictionary: aFirstDictionary doesNotEqual: aSecondDictionary [
	"Test symmetric inequality"

	self
		deny: aFirstDictionary equals: aSecondDictionary;
		deny: aSecondDictionary equals: aFirstDictionary
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertDictionary: aFirstDictionary equals: aSecondDictionary [
	"Test reflixive and symmetric equality."

	self
		assert: aFirstDictionary equals: aFirstDictionary;
		assert: aFirstDictionary equals: aSecondDictionary;
		assert: aSecondDictionary equals: aSecondDictionary;
		assert: aSecondDictionary equals: aFirstDictionary
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertIsArray: anArray withElements: aCollection [

	self
		assert: anArray isArray;
		assert: anArray equals: aCollection asArray
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertIsDictionary: aFirstDictionary copiedFrom: aSecondDictionary withOrderedAssociations: anAssociationCollection [

	self
		deny: aFirstDictionary identicalTo: aSecondDictionary;
		deny: aFirstDictionary dictionary
		identicalTo: aSecondDictionary dictionary;
		deny: aFirstDictionary orderedKeys
		identicalTo: aSecondDictionary orderedKeys.

	"esnure the associations were copied (the keys and values can be shared)"
	aFirstDictionary associations do: [ :each |
		self deny:
			(aSecondDictionary associations includesIdenticalTo: each) ].

	self
		assertIsDictionary: aFirstDictionary
		withOrderedAssociations: anAssociationCollection
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertIsDictionary: anObject withOrderedAssociations: anAssociationCollection [
	"Tests that anObject is an instance of the correct dictionary class
	with the specified ordered associations"

	self
		assert: anObject class identicalTo: self dictionaryClass;
		assert: anObject orderedKeys size >= anAssociationCollection size;
		assert: anObject associations size equals: anAssociationCollection size.

	anAssociationCollection
		withIndexDo: [ :each :i |
			self isTestingIdentityDictionary
				ifTrue: [ self
						assert: (anObject orderedKeys at: i) identicalTo: each key;
						assert: (anObject associations at: i) key identicalTo: each key ]
				ifFalse: [ self
						assert: (anObject orderedKeys at: i) equals: each key;
						assert: (anObject associations at: i) key equals: each key ].
			self assert: (anObject associations at: i) value equals: each value ]
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertIsDictionary: anObject withUnorderedAssociations: anAssociationCollection [
	"Tests that anObject is an instance of the correct dictionary class
	with the specified associations, but ignoring the order"

	self
		assert: anObject class identicalTo: self dictionaryClass;
		assert: anObject size equals: anAssociationCollection size.
	anAssociationCollection do: [ :each | self assert: (anObject includesAssociation: each) ]
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> assertKey: aKey wasRemovedfrom: aDictionary [

	self deny: (aDictionary includesKey: aKey).
	aDictionary keys asArray, aDictionary orderedKeys asArray do: [:each |
		self deny:
			(self isTestingIdentityDictionary
				ifTrue: [each == aKey]
				ifFalse: [each = aKey])]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> changedOrderedAssociations [

	^ self orderedAssociations collect: [:each | each key -> self newValue]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> changedOrderedAssociationsFirst: anInteger [

	^ self changedOrderedAssociations copyFirst: anInteger
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> collectClass [

	^ Array
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> defaultCapacity [

	^ self emptyInternalDictionary capacity
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> dictionaryClass [

	^ OrderedDictionary
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> dictionaryWithOrderedAssociations [

	^ self dictionaryClass newFrom: self orderedAssociations
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> emptyDictionary [

	^ self dictionaryClass new
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> emptyInternalDictionary [

	^ self internalDictionaryClass new
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> identityAbsentKey [

	^ self orderedKeys first copy
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> identityOrderedAssociations [
	"Returns ordered associations to use for identity dictionaries.
	The keys are all #= equal but #== different, so only an
	identity dictionary will be able to distinguish them."
	identityOrderedAssociations
		ifNil: [| key |
			key := 'testKey'.
			identityOrderedAssociations :=
				Array
					with: (key := key copy) -> 'testValue'
					with: (key := key copy) -> 'testValue3'
					with: (key := key copy) -> 'testValue2'
					with: (key := key copy) -> 'testValue4'].
	"Return copies of the associations so they can be safely modified
	in one test without affecting another, but do not copy the keys
	and values"
	^ identityOrderedAssociations collect: [:each | each copy]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> internalDictionaryClass [

	^self isTestingIdentityDictionary
		ifTrue: [ IdentityDictionary]
		ifFalse: [ Dictionary]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> internalDictionaryWithAssociations [

	^ self internalDictionaryClass newFrom: self orderedAssociations
]

{ #category : #testing }
OrderedDictionaryExtensionsTest >> isTestingIdentityDictionary [

	^ false
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> newValue [

	^ 'newValue'
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> nonIdentityAbsentKey [

	^ 'absentKey'
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> nonIdentityOrderedAssociations [
	"Returns ordered associations to use for non-identity dictionaries.
	The keys are all #= and #== different and are returned out of their
	natural sort order."
	nonIdentityOrderedAssociations
		ifNil: [
			nonIdentityOrderedAssociations :=
				Array
					with: 'testKey' -> 'testValue'
					with: 'testKey3' -> 'testValue3'
					with: 'testKey2' -> 'testValue2'
					with: 'testKey4' -> 'testValue4'].
	"return copies of the associations so they can be safely modified
	in one test without affecting another, but do not copy the keys
	and values"
	^ nonIdentityOrderedAssociations collect: [:each | each copy]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedAssociations [
	^self isTestingIdentityDictionary
		ifTrue: [ self identityOrderedAssociations ]
		ifFalse: [ self nonIdentityOrderedAssociations ]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedAssociationsAllButFirst: anInteger [

	^ self orderedAssociations allButFirst: anInteger
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedAssociationsFirst: anInteger [

	^ self orderedAssociations copyFirst: anInteger
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedKeys [

	^ self orderedAssociations collect: [:each | each key]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedKeysFirst: anInteger [

	^ self orderedKeys copyFirst: anInteger
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedValues [

	^ self orderedAssociations collect: [:each | each value]
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> orderedValuesFirst: anInteger [

	^ self orderedValues copyFirst: anInteger
]

{ #category : #accessing }
OrderedDictionaryExtensionsTest >> otherOrderedDictionaryClasses [

	^ OrderedDictionary withAllSubclasses copyWithout: self dictionaryClass
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> should: aBlock enumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated add: each].
	self assert: enumerated equals: aCollection asOrderedCollection
]

{ #category : #assertions }
OrderedDictionaryExtensionsTest >> should: aBlock enumerate: aFirstCollection and: aSecondCollection [
	| firstEnumerated secondEnumerated |

	firstEnumerated := OrderedCollection new.
	secondEnumerated := OrderedCollection new.
	aBlock value: [:first :second |
		firstEnumerated addLast: first.
		secondEnumerated addLast: second].
	self
		assert: firstEnumerated equals: aFirstCollection asOrderedCollection;
		assert: secondEnumerated equals: aSecondCollection asOrderedCollection
]

{ #category : #'tests - adding' }
OrderedDictionaryExtensionsTest >> testAdd [
	| dictionary |
	dictionary := self emptyDictionary.
	self orderedAssociations
		withIndexDo: [ :each :i |
			self
				deny: (dictionary includesAssociation: each);
				assert: (dictionary add: each) identicalTo: each;
				assert: (dictionary includesAssociation: each).
			self assertIsDictionary: dictionary withOrderedAssociations: (self orderedAssociationsFirst: i) ].

	"ensure adding the same associations doesn't change the order"
	self orderedAssociations
		reverseDo: [ :each |
			self assert: (dictionary add: each) identicalTo: each.
			self assertIsDictionary: dictionary withOrderedAssociations: self orderedAssociations ].

	self changedOrderedAssociations
		withIndexDo: [ :each :i |
			| old |
			old := self orderedAssociations at: i.
			self
				assert: (dictionary add: each) identicalTo: each;
				assert: (dictionary includesAssociation: each);
				deny: (dictionary includesAssociation: old).
			self assertIsDictionary: dictionary withOrderedAssociations: (self changedOrderedAssociationsFirst: i) , (self orderedAssociationsAllButFirst: i) ]
]

{ #category : #'tests - adding' }
OrderedDictionaryExtensionsTest >> testAddAll [
	| dictionary addedAssociations |
	dictionary := self emptyDictionary.
	self orderedAssociations do: [ :each | self deny: (dictionary includesAssociation: each) ].

	addedAssociations := self orderedAssociations.
	self assert: (dictionary addAll: addedAssociations) identicalTo: addedAssociations.
	self assertIsDictionary: dictionary withOrderedAssociations: self orderedAssociations.

	"ensure adding the same associations doesn't change the order"
	addedAssociations := self orderedAssociations reversed.
	self assert: (dictionary addAll: addedAssociations) identicalTo: addedAssociations.
	self assertIsDictionary: dictionary withOrderedAssociations: self orderedAssociations.

	addedAssociations := self changedOrderedAssociations.
	self assert: (dictionary addAll: addedAssociations) identicalTo: addedAssociations.
	self assertIsDictionary: dictionary withOrderedAssociations: self changedOrderedAssociations
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAssociationAt [
	| dictionary |
	dictionary := self emptyDictionary.
	self orderedAssociations
		do: [ :each |
			self should: [ dictionary associationAt: each key ] raise: Error.

			dictionary add: each.
			self assert: (dictionary associationAt: each key) equals: each ]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAssociationAtIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				associationAt: each key
				ifAbsent: [self absentValue]) equals: self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				associationAt: each key
				ifAbsent: [self fail]) equals: each]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAssociationAtIfPresent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [self fail]) isNil.

		dictionary add: each.
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [:assoc | self newValue -> assoc]) equals: (self newValue -> each).
		"ensure cull: is used"
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [self newValue]) equals: self newValue]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAssociations [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary associations
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary associations
			withElements: (self orderedAssociationsFirst: i)]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testAssociationsDo [

	| dictionary |
	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary associationsDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary associationsDo: block]
			enumerate: (self orderedAssociationsFirst: i)]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testAssociationsSelect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations do: [:assoc | | selectedAssociations |
		selectedAssociations := self orderedAssociations copyWithout: assoc.
		self
			assertIsDictionary:
				(dictionary associationsSelect: [:each |
					selectedAssociations includes: each])
			copiedFrom: dictionary
			withOrderedAssociations:
				(self orderedAssociations select: [:each |
					selectedAssociations includes: each])]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			should: [dictionary at: each key]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary at: each key) equals: each value]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifAbsent: [self absentValue]) equals: self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				at: each key
				ifAbsent: [self fail]) equals: each value]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtIfAbsentPut [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				ifAbsentPut: [each value]) equals: each value.
		self assert:
			(dictionary
				at: each key
				ifAbsentPut: [self fail]) equals: each value.
		self
			assertIsArray: dictionary keys
			withElements: (self orderedKeysFirst: i) ]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtIfPresent [
	| dictionary |
	dictionary := self emptyDictionary.
	self orderedAssociations
		do: [ :each |
			self assert: (dictionary at: each key ifPresent: [ self fail ]) isNil.

			dictionary add: each.
			self assert: (dictionary at: each key ifPresent: [ :value | self newValue -> value ]) equals: self newValue -> each value.
			"ensure cull: is used"
			self assert: (dictionary at: each key ifPresent: [ self newValue ]) equals: self newValue ]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtIfPresentIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifPresent: [self fail]
				ifAbsent: [self absentValue]) equals: self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				at: each key
				ifPresent: [:value | self newValue -> value]
				ifAbsent: [self fail]) equals: (self newValue -> each value).
		"ensure cull: is used"
		self assert:
			(dictionary
				at: each key
				ifPresent: [self newValue]
				ifAbsent: [self fail]) equals: self newValue]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtIfPresentIfAbsentPut [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				ifPresent: [ self fail ]
				ifAbsentPut: [ each value ]) equals: each value.
		self assert:
			(dictionary
				at: each key
				ifPresent: [ :it | self newValue -> it ]
				ifAbsentPut: [self fail]) equals: (self newValue -> each value).
		self
			assertIsArray: dictionary keys
			withElements: (self orderedKeysFirst: i) ]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testAtPut [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				put: each value) equals: each value.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsFirst: i)].

	self changedOrderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				put: each value) equals: each value.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations:
				(self changedOrderedAssociationsFirst: i),
				(self orderedAssociationsAllButFirst: i)]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testBindingsDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary bindingsDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary bindingsDo: block]
			enumerate: (self orderedAssociationsFirst: i)]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testCapacity [
	"The current Dictionary implementation allocates more than specified.
	The amount allocated may change in the future but it likely won't ever
	be less than specified, so a >= test is used throughout."

	| defaultCapacity dictionary |

	defaultCapacity := self defaultCapacity.
	dictionary := self dictionaryClass new.
	self assert: dictionary capacity >= defaultCapacity.

	dictionary := self dictionaryClass new: (defaultCapacity / 2) asInteger.
	self assert: dictionary capacity >= (defaultCapacity / 2) asInteger.

	dictionary := self dictionaryClass newFrom: self orderedAssociations.
	self assert: dictionary capacity >= self orderedAssociations size.

	self orderedAssociations size to: 0 by: -1 do: [:i |
		self
			shouldnt: [
				dictionary := self dictionaryClass new: i.
				dictionary addAll: self orderedAssociations]
			raise: Error]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testCollect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self
		assertIsDictionary:
			(dictionary collect: [:each | each hash])
		copiedFrom: dictionary
		withOrderedAssociations:
			(self orderedAssociations collect: [:each | each key -> each value hash])
]

{ #category : #'tests - copying' }
OrderedDictionaryExtensionsTest >> testCopy [
	| dictionary copy |

	dictionary := self dictionaryWithOrderedAssociations.
	copy := dictionary copy.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: copy
		copiedFrom: dictionary
		withOrderedAssociations: self orderedAssociations
]

{ #category : #'tests - copying' }
OrderedDictionaryExtensionsTest >> testCopyEmpty [
	| dictionary copy |

	dictionary := self dictionaryWithOrderedAssociations.
	copy := dictionary copyEmpty.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: copy
		copiedFrom: dictionary
		withOrderedAssociations: #()
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testDeclareFrom [
	| dictionary otherDictionary |
	dictionary := self emptyDictionary.
	otherDictionary := self dictionaryWithOrderedAssociations.
	self orderedKeys do: [ :each | self assert: (dictionary declare: each from: otherDictionary) identicalTo: dictionary ].
	self assertIsDictionary: dictionary withOrderedAssociations: self orderedAssociations.
	self assert: otherDictionary isEmpty.

	self orderedKeys
		do: [ :each |
			otherDictionary add: each -> self newValue.
			self assert: (dictionary declare: each from: otherDictionary) identicalTo: dictionary ].
	self assertIsDictionary: dictionary withOrderedAssociations: self orderedAssociations
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testDictionary [
	| dictionary |
	dictionary := self emptyDictionary.
	self
		assert: dictionary dictionary class identicalTo: self internalDictionaryClass;
		assert: dictionary dictionary equals: self emptyInternalDictionary.

	dictionary := self dictionaryWithOrderedAssociations.
	self
		assert: dictionary dictionary class identicalTo: self internalDictionaryClass;
		assert: dictionary dictionary equals: self internalDictionaryWithAssociations
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary do: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary do: block]
			enumerate: (self orderedValuesFirst: i)]
]

{ #category : #'tests - comparing' }
OrderedDictionaryExtensionsTest >> testEquals [
	| dictionaryOne dictionaryTwo |

	dictionaryOne := self emptyDictionary.
	dictionaryTwo := self emptyDictionary.
	self
		assertDictionary: dictionaryOne
		equals: dictionaryTwo.

	"For equality, order will not matter"
	self orderedAssociations
		with: self orderedAssociations reversed
		do: [:firstAssociation :secondAssociation |
			dictionaryOne add: firstAssociation.
			dictionaryTwo add: secondAssociation.
			self
				assertDictionary: dictionaryOne
				doesNotEqual: self emptyDictionary.
			self
				assertDictionary: dictionaryTwo
				doesNotEqual: self emptyDictionary.
			dictionaryOne size < self orderedAssociations size
				ifTrue: [
					self
						assertDictionary: dictionaryOne
						doesNotEqual: dictionaryTwo]].

	self
		assertDictionary: dictionaryOne
		equals: dictionaryTwo
]

{ #category : #'tests - comparing' }
OrderedDictionaryExtensionsTest >> testEqualsDictionary [
	self
		assertDictionary: self emptyDictionary
		doesNotEqual: self emptyInternalDictionary.

	self
		assertDictionary: self dictionaryWithOrderedAssociations
		doesNotEqual: self internalDictionaryWithAssociations
]

{ #category : #'tests - comparing' }
OrderedDictionaryExtensionsTest >> testHash [
	| dictionary otherDictionary internalDictionary otherInternalDictionary |
	dictionary := self emptyDictionary.
	otherDictionary := self emptyDictionary.
	internalDictionary := self emptyInternalDictionary.
	otherInternalDictionary := self emptyInternalDictionary.
	self assert: dictionary hash equals: otherDictionary hash.
	self orderedAssociations
		do: [ :each |
			dictionary add: each.
			internalDictionary add: each copy.
			"if the internal hashes differ after adding to one, the external should too"
			internalDictionary hash = otherInternalDictionary hash ifFalse: [ self deny: dictionary hash equals: otherDictionary hash ].

			otherDictionary add: each copy.
			otherInternalDictionary add: each copy.
			"should be equal regardless now"
			self assert: dictionary hash equals: otherDictionary hash ]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testIdentityIndexOfKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary identityIndexOfKey: each key) equals: 0.

		dictionary add: each.
		self
			assert: (dictionary identityIndexOfKey: each key) equals: i;
			assert: (dictionary identityIndexOfKey: each key copy) equals: 0]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testIdentityIndexOfKeyIfAbsent [
	| dictionary |
	dictionary := self emptyDictionary.
	self orderedAssociations
		withIndexDo: [ :each :i |
			self assert: (dictionary identityIndexOfKey: each key ifAbsent: [ self absentValue ]) equals: self absentValue.

			dictionary add: each.
			self assert: (dictionary identityIndexOfKey: each key ifAbsent: [ self fail ]) equals: i.
			self assert: (dictionary identityIndexOfKey: each key copy ifAbsent: [ self absentValue ]) equals: self absentValue ]
]

{ #category : #'tests - testing' }
OrderedDictionaryExtensionsTest >> testIncludes [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includes: each value).

		dictionary add: each.
		self assert: (dictionary includes: each value)]
]

{ #category : #'tests - testing' }
OrderedDictionaryExtensionsTest >> testIncludesAssociation [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			deny: (dictionary includesAssociation: each);
			deny: (dictionary includesAssociation: each key -> each value).

		dictionary add: each.
		self
			assert: (dictionary includesAssociation: each);
			assert: (dictionary includesAssociation: each key -> each value)]
]

{ #category : #'tests - testing' }
OrderedDictionaryExtensionsTest >> testIncludesIdenticalTo [

	| dictionary |
	dictionary := self emptyDictionary.
	self orderedAssociations do: [ :each |
		self deny: (dictionary includesIdenticalTo: each value).

		dictionary add: each.
		self
			assert: (dictionary includesIdenticalTo: each value);
			deny: (dictionary includesIdenticalTo: each value copy) ]
]

{ #category : #'tests - testing' }
OrderedDictionaryExtensionsTest >> testIncludesKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includesKey: each key).

		dictionary add: each.
		self assert: (dictionary includesKey: each key)]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testIndexOfKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary indexOfKey: each key) equals: 0.

		dictionary add: each.
		self assert: (dictionary indexOfKey: each key) equals: i]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testIndexOfKeyIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				indexOfKey: each key
				ifAbsent: [self absentValue]) equals: self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				indexOfKey: each key
				ifAbsent: [self fail]) equals: i]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testIsDictionary [
	self assert: self dictionaryClass new isDictionary
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testKeys [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary keys
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary keys
			withElements: (self orderedKeysFirst: i)]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testKeysAndValuesDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary keysAndValuesDo: block]
		enumerate: #()
		and: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary keysAndValuesDo: block]
			enumerate: (self orderedKeysFirst: i)
			and: (self orderedValuesFirst: i)]
]

{ #category : #'tests - removing' }
OrderedDictionaryExtensionsTest >> testKeysAndValuesRemove [
	| dictionary |
	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations
		withIndexDo: [ :removedAssociation :i |
			| unremovedAssociations |
			unremovedAssociations := (self orderedAssociationsAllButFirst: i) asOrderedCollection.
			dictionary
				keysAndValuesRemove: [ :key :value |
					(self isTestingIdentityDictionary ifTrue: [ key == removedAssociation key ] ifFalse: [ key = removedAssociation key ])
						ifTrue: [ self assert: value equals: removedAssociation value.
							true ]
						ifFalse: [ | unremovedAssociation |
							unremovedAssociation := unremovedAssociations removeFirst.
							self isTestingIdentityDictionary
								ifTrue: [ self assert: key identicalTo: unremovedAssociation key ]
								ifFalse: [ self assert: key equals: unremovedAssociation key ].
							self assert: value equals: unremovedAssociation value.
							false ] ].
			self assert: unremovedAssociations isEmpty.
			self assertKey: removedAssociation key wasRemovedfrom: dictionary ].
	self assert: dictionary isEmpty
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testKeysDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary keysDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary keysDo: block]
			enumerate: (self orderedKeysFirst: i)]
]

{ #category : #'tests - creation' }
OrderedDictionaryExtensionsTest >> testNewFrom [
	| dictionary |

	dictionary := self dictionaryClass newFrom: self orderedAssociations.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: (self dictionaryClass newFrom: dictionary)
		copiedFrom: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary:
			(self dictionaryClass newFrom: self internalDictionaryWithAssociations)
		withUnorderedAssociations: self orderedAssociations
]

{ #category : #'tests - creation' }
OrderedDictionaryExtensionsTest >> testNewFromKeysAndValues [ 

	| dict newDict |
	dict := self dictionaryClass new
	       at: #a put: 1;
			 at: #b put: 2;
			 at: #c put: 3; yourself.
	newDict := self dictionaryClass newFromKeys: dict keys andValues: dict values.
	dict keysAndValuesDo: [:k :v|
		self assert: (newDict at: k) equals: v ]
]

{ #category : #'tests - creation' }
OrderedDictionaryExtensionsTest >> testNewFromPairs [
	| pairs |

	pairs := OrderedCollection new.
	self orderedAssociations do: [:each |
		pairs
			addLast: each key;
			addLast: each value].

	0 to: pairs size do: [:i |
		self
			assertIsDictionary:
				(self dictionaryClass newFromPairs: (pairs copyFrom: 1 to: i))
			withOrderedAssociations:
				(self orderedAssociationsFirst: (i / 2) floor)]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testOccurrencesOf [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: (dictionary occurrencesOf: self newValue) equals: 0.
	self orderedKeys withIndexDo: [:each :i |
		dictionary
			at: each
			put: self newValue.
		self assert: (dictionary occurrencesOf: self newValue) equals: i]
]

{ #category : #'tests - removing' }
OrderedDictionaryExtensionsTest >> testRemoveAll [

	| dictionary removedKeys |
	dictionary := self dictionaryWithOrderedAssociations.
	removedKeys := dictionary keys.
	self
		deny: dictionary isEmpty;
		assert: dictionary removeAll identicalTo: dictionary;
		assert: dictionary isEmpty.
	removedKeys do: [ :each |
		self assertKey: each wasRemovedfrom: dictionary ]
]

{ #category : #'tests - removing' }
OrderedDictionaryExtensionsTest >> testRemoveKey [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary removeKey: each key) equals: each value.
		self
			assertKey: each key
			wasRemovedfrom: dictionary.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

		self
			should: [dictionary removeKey: each key]
			raise: Error]
]

{ #category : #'tests - removing' }
OrderedDictionaryExtensionsTest >> testRemoveKeyIfAbsent [
	| dictionary |
	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations
		withIndexDo: [ :each :i |
			self assert: (dictionary removeKey: each key ifAbsent: [ self fail ]) equals: each value.
			self assertKey: each key wasRemovedfrom: dictionary.
			self assertIsDictionary: dictionary withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

			self assert: (dictionary removeKey: each key ifAbsent: [ self absentValue ]) equals: self absentValue ]
]

{ #category : #'tests - removing' }
OrderedDictionaryExtensionsTest >> testRemoveKeys [
	0 to: self orderedAssociations size do: [ :i |
		| dictionary keysToRemove |
		dictionary := self dictionaryWithOrderedAssociations.

		"make it a set to ensure it supports non-Sequenceable collections"
		keysToRemove := (self isTestingIdentityDictionary ifTrue: [ IdentitySet ] ifFalse: [ Set ]) withAll: (self orderedKeysFirst: i).
		self assert: (dictionary removeKeys: keysToRemove) identicalTo: dictionary.
		keysToRemove do: [ :each | self assertKey: each wasRemovedfrom: dictionary ].

		self assertIsDictionary: dictionary withOrderedAssociations: (self orderedAssociationsAllButFirst: i) ]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testSelect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedValues do: [:value | | selectedValues |
		selectedValues := self orderedValues copyWithout: value.
		self
			assertIsDictionary:
				(dictionary select: [:each |
					selectedValues includes: each])
			copiedFrom: dictionary
			withOrderedAssociations:
				(self orderedAssociations select: [:each |
					selectedValues includes: each value])]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testSize [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: dictionary size equals: 0.

	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self assert: dictionary size equals: i].

	self orderedAssociations size to: 1 by: -1 do: [:i |
		dictionary removeKey: (self orderedKeys at: i).
		self assert: dictionary size equals: (i - 1)]
]

{ #category : #'tests - accessing' }
OrderedDictionaryExtensionsTest >> testValues [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary values
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary values
			withElements: (self orderedValuesFirst: i)]
]

{ #category : #'tests - enumerating' }
OrderedDictionaryExtensionsTest >> testValuesDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary valuesDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary valuesDo: block]
			enumerate: (self orderedValuesFirst: i)]
]
