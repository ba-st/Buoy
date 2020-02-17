Class {
	#name : #StandardComparator,
	#superclass : #Object,
	#instVars : [
		'differentiationBlock'
	],
	#category : #'Buoy-Comparison'
}

{ #category : #'instance creation' }
StandardComparator class >> differentiatingSending: aSelectorsCollection [

	^aSelectorsCollection isEmpty
		ifTrue: [self differentiatingType]
		ifFalse: [
			self differentiatingThrough: [:oneObject :anotherObject |
				aSelectorsCollection allSatisfy: [:selector |
					(oneObject perform: selector) = (anotherObject perform: selector)]]]
]

{ #category : #'instance creation' }
StandardComparator class >> differentiatingThrough: aBlock [

	^self new initializeDifferentiatingThrough: aBlock
]

{ #category : #'instance creation' }
StandardComparator class >> differentiatingType [

	^self differentiatingThrough: [:anObject :anotherObject | true]


]

{ #category : #Testing }
StandardComparator >> check: anObject against: anotherObject [

	^anObject == anotherObject or: [
		(anotherObject isA: anObject class)
			and: [differentiationBlock value: anObject value: anotherObject]]
]

{ #category : #initialization }
StandardComparator >> initializeDifferentiatingThrough: aBlock [

	differentiationBlock := aBlock
]
