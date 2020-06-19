"
I'm an example used for testing purposes
"
Class {
	#name : #ObjectUsingComparisonAffordances,
	#superclass : #Object,
	#instVars : [
		'first',
		'second'
	],
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #'instance creation' }
ObjectUsingComparisonAffordances class >> with: anInteger and: anInteger2 [

	^ self new initializeWith: anInteger and: anInteger2
]

{ #category : #comparing }
ObjectUsingComparisonAffordances >> = anObject [

	^ self equalityChecker
		compareAll: #(#first #second);
		checkAgainst: anObject
]

{ #category : #accessing }
ObjectUsingComparisonAffordances >> first [
	^ first
]

{ #category : #comparing }
ObjectUsingComparisonAffordances >> hash [

	^ self equalityHashCombinator combineHashOf: first with: second
]

{ #category : #initialization }
ObjectUsingComparisonAffordances >> initializeWith: anInteger and: anInteger2 [

	first := anInteger.
	second := anInteger2
]

{ #category : #accessing }
ObjectUsingComparisonAffordances >> second [
	^ second
]
