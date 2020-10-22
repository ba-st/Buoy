"
I'm a checker that can be configured to check for certain properties to determine object equality.
I'm the default checker available to any object by sending equalityChecker to itself.
"
Class {
	#name : #PropertyBasedEqualityChecker,
	#superclass : #EqualityChecker,
	#instVars : [
		'base',
		'comparisonRules'
	],
	#category : #'Buoy-Comparison'
}

{ #category : #'instance creation' }
PropertyBasedEqualityChecker class >> on: aBaseObject [

	^ self new initializeOn: aBaseObject
]

{ #category : #testing }
PropertyBasedEqualityChecker >> check: aBaseObject against: aTargetObject [

	^ ( self is: aBaseObject identicalTo: aTargetObject )
		or: [ ( aTargetObject isA: aBaseObject class )
				and: [ comparisonRules allSatisfy: [ :rule | rule value: aBaseObject value: aTargetObject ] ]
			]
]

{ #category : #testing }
PropertyBasedEqualityChecker >> checkAgainst: aTargetObject [

	^ self check: base against: aTargetObject
]

{ #category : #configuring }
PropertyBasedEqualityChecker >> compare: aPropertyOrMonadycBlock [

	self
		compareWith:
			[ :first :second | ( aPropertyOrMonadycBlock value: first ) = ( aPropertyOrMonadycBlock value: second ) ]
]

{ #category : #configuring }
PropertyBasedEqualityChecker >> compareAll: aPropertyCollection [

	aPropertyCollection do: [ :property | self compare: property ]
]

{ #category : #configuring }
PropertyBasedEqualityChecker >> compareWith: aDyadicBlock [

	comparisonRules add: aDyadicBlock
]

{ #category : #initialization }
PropertyBasedEqualityChecker >> initialize [ 

	super initialize.
	comparisonRules := OrderedCollection new
]

{ #category : #initialization }
PropertyBasedEqualityChecker >> initializeOn: aBaseObject [

	base := aBaseObject
]
