Class {
	#name : #StandardComparison,
	#superclass : #Object,
	#instVars : [
		'differentiationBlock'
	],
	#category : #'Buoy-Comparison'
}

{ #category : #'instance creation' }
StandardComparison class >> differentiatingSending: aSelectorsCollection [

	^aSelectorsCollection isEmpty
		ifTrue: [self differentiatingType]
		ifFalse: [
			self differentiatingThrough: [:oneObject :anotherObject |
				aSelectorsCollection allSatisfy: [:selector |
					(oneObject perform: selector) = (anotherObject perform: selector)]]]
]

{ #category : #'instance creation' }
StandardComparison class >> differentiatingThrough: aBlock [

	^self new initializeDifferentiatingThrough: aBlock
]

{ #category : #'instance creation' }
StandardComparison class >> differentiatingType [

	^self differentiatingThrough: [:anObject :anotherObject | true]


]

{ #category : #Testing }
StandardComparison >> check: anObject against: anotherObject [

	^anObject == anotherObject or: [
		(anotherObject isA: anObject class)
			and: [differentiationBlock value: anObject value: anotherObject]]
]

{ #category : #initialization }
StandardComparison >> initializeDifferentiatingThrough: aBlock [

	differentiationBlock := aBlock
]
