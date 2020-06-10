"
I'm a HashCombinator that uses bitXor: as the operation combinator.
"
Class {
	#name : #BitwiseExclusiveDisjunctionHashCombinator,
	#superclass : #HashCombinator,
	#category : #'Buoy-Comparison'
}

{ #category : #combining }
BitwiseExclusiveDisjunctionHashCombinator >> combine: acumulatedHashValue with: hashValue [

	^ acumulatedHashValue bitXor: hashValue
]
