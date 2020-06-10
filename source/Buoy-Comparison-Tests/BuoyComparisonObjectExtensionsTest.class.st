Class {
	#name : #BuoyComparisonObjectExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
BuoyComparisonObjectExtensionsTest >> testHash [

	self assert: ( ObjectUsingEqualityHashCombinator with: 1 and: 2 ) hash equals: ( 1 bitXor: 2 )
]
