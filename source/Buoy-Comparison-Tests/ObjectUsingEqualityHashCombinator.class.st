Class {
	#name : #ObjectUsingEqualityHashCombinator,
	#superclass : #Object,
	#instVars : [
		'first',
		'second'
	],
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #'instance creation' }
ObjectUsingEqualityHashCombinator class >> with: anInteger and: anInteger2 [

	^ self new initializeWith: anInteger and: anInteger2
]

{ #category : #comparing }
ObjectUsingEqualityHashCombinator >> hash [

	^ self equalityHashCombinator combineHashOf: first with: second
]

{ #category : #initialization }
ObjectUsingEqualityHashCombinator >> initializeWith: anInteger and: anInteger2 [

	first := anInteger.
	second := anInteger2
]
