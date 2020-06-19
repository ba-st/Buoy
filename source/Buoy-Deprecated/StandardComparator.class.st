Class {
	#name : #StandardComparator,
	#superclass : #Object,
	#instVars : [
		'differentiationBlock'
	],
	#category : #'Buoy-Deprecated'
}

{ #category : #'instance creation' }
StandardComparator class >> differentiatingSending: aSelectorsCollection [

	self
		deprecated: 'Use equalityChecker'
		transformWith: '`@object differentiatingSending: `@selectors' -> 'self equalityChecker compare: `@selectors'.

	^ self
]

{ #category : #'instance creation' }
StandardComparator class >> differentiatingThrough: aBlock [

	self
		deprecated: 'Use equalityChecker'
		transformWith: '`@object differentiatingThrough: `@block' -> 'self equalityChecker compareWith: `@block'.
	^ self
]

{ #category : #'instance creation' }
StandardComparator class >> differentiatingType [

	self
		deprecated: 'Use equalityChecker'
		transformWith: '`@object differentiatingType' -> 'self equalityChecker'.
	^ self
]

{ #category : #testing }
StandardComparator class >> isDeprecated [

	^ true
]

{ #category : #Testing }
StandardComparator >> check: anObject against: anotherObject [

	self
		deprecated: 'Use equalityChecker affordances'
		transformWith: '`@checker check: `@anObject against: `@anotherObject' -> '`@checker checkAgainst: `@anotherObject'
]
