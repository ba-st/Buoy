"
I'm a HashCombinator that uses bitXor: as the operation combinator.
"
Class {
	#name : #BitwiseExclusiveDisjunctionHashCombinator,
	#superclass : #HashCombinator,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Buoy-Comparison'
}

{ #category : #'instance creation' }
BitwiseExclusiveDisjunctionHashCombinator class >> new [

	uniqueInstance ifNil: [ uniqueInstance := super new ].
	^ uniqueInstance
]

{ #category : #combining }
BitwiseExclusiveDisjunctionHashCombinator >> combine: acumulatedHashValue with: hashValue [

	^ acumulatedHashValue bitXor: hashValue
]
