"
I'm an abstract class defining the interface for hash combination. My intent is to provide a way of generate a hash by combining the hash of other objects.
"
Class {
	#name : #HashCombinator,
	#superclass : #Object,
	#category : #'Buoy-Comparison'
}

{ #category : #combining }
HashCombinator >> combine: acumulatedHashValue with: hashValue [

	self subclassResponsibility
]

{ #category : #combining }
HashCombinator >> combineAll: hashes [

	^ self combineAll: hashes doing: [ :hash | hash ]
]

{ #category : #combining }
HashCombinator >> combineAll: aCollection doing: aMonadycBlock [

	AssertionChecker
		enforce: [ aCollection notEmpty ]
		because: 'Cannot combine an empty collection of hashes'.

	^ aCollection withoutFirst
		inject: ( aMonadycBlock value: aCollection first )
		into: [ :combined :each | self combine: combined with: ( aMonadycBlock value: each ) ]
]

{ #category : #combining }
HashCombinator >> combineHashOf: anObject with: anotherObject [

	^ self combine: anObject hash with: anotherObject hash
]

{ #category : #combining }
HashCombinator >> combineHashesOfAll: aCollection [ 
	
	^ self combineAll: aCollection doing: [ :object | object hash ]
]
