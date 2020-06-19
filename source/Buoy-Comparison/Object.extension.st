Extension { #name : #Object }

{ #category : #'*Buoy-Comparison' }
Object >> equalityChecker [

	^ PropertyBasedEqualityChecker on: self
]

{ #category : #'*Buoy-Comparison' }
Object >> equalityHashCombinator [

	^ BitwiseExclusiveDisjunctionHashCombinator new
]
