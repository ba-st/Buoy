Class {
	#name : 'DictionaryExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Collections-Tests',
	#package : 'Buoy-Collections-Tests'
}

{ #category : 'tests' }
DictionaryExtensionsTest >> testAtIfPresentIfAbsentPut [

	| dictionary wasPresent |
	dictionary := Dictionary new.
	dictionary at: #one ifPresent: [ self fail ] ifAbsentPut: [ 1 ].
	self assert: (dictionary at: #one) equals: 1.
	wasPresent := false.
	dictionary
		at: #one
		ifPresent: [ :one |
			wasPresent := true.
			self assert: one equals: 1 ]
		ifAbsentPut: [ self fail ].
	self assert: wasPresent
]

{ #category : 'tests' }
DictionaryExtensionsTest >> testNewFromPairs [

	| dictionary |
	dictionary := Dictionary newFromPairs: #( one 1 two 2 ).

	self
		assert: dictionary size equals: 2;
		assert: (dictionary at: #one) equals: 1;
		assert: (dictionary at: #two) equals: 2
]

{ #category : 'tests' }
DictionaryExtensionsTest >> testRemoveAll [

	| dictionary |
	dictionary := Dictionary newFromPairs: #( one 1 two 2 ).

	self assert: dictionary size equals: 2.

	dictionary removeAll.
	self assert: dictionary isEmpty
]
