Class {
	#name : #BuoyComparisonObjectExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
BuoyComparisonObjectExtensionsTest >> testEqual [

	self
		assert: ( ObjectUsingComparisonAffordances with: 1 and: 2 )
			equals: ( ObjectUsingComparisonAffordances with: 1 and: 2 );
		deny: ( ObjectUsingComparisonAffordances with: 1 and: 2 )
			equals: ( ObjectUsingComparisonAffordances with: 2 and: 1 );
		deny: ( ObjectUsingComparisonAffordances with: 1 and: 2 ) equals: self
]

{ #category : #tests }
BuoyComparisonObjectExtensionsTest >> testHash [

	self
		assert: (ObjectUsingComparisonAffordances with: 1 and: 2) hash
		equals: (1 hash bitXor: 2 hash)
]
