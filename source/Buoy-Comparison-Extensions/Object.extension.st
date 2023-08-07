Extension { #name : #Object }

{ #category : #'*Buoy-Comparison-Extensions' }
Object >> equalityChecker [

	^ PropertyBasedEqualityChecker on: self
]

{ #category : #'*Buoy-Comparison-Extensions' }
Object >> equalityHashCombinator [

	^ BitwiseExclusiveDisjunctionHashCombinator new
]
