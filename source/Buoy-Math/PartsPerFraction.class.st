"
I'm an abstract class representing several kinds of parts-per-fraction objects: like percentages, permille, basis point, etc.
"
Class {
	#name : #PartsPerFraction,
	#superclass : #Number,
	#instVars : [
		'ratio'
	],
	#category : #'Buoy-Math'
}

{ #category : #private }
PartsPerFraction class >> fraction [

	^ self subclassResponsibility
]

{ #category : #testing }
PartsPerFraction class >> isAbstract [

	^ self = PartsPerFraction
]

{ #category : #'Instance Creation' }
PartsPerFraction class >> of: aNumber [

	^ self ratio: aNumber / self fraction
]

{ #category : #'Instance Creation' }
PartsPerFraction class >> ratio: aRatio [
		
	^self basicNew initializeRatio: aRatio 
]

{ #category : #arithmetic }
PartsPerFraction >> * aNumber [

	^ ratio * aNumber asNumber
]

{ #category : #arithmetic }
PartsPerFraction >> + aNumber [

	^ (aNumber isA: self class)
		  ifTrue: [ self class ratio: ratio + aNumber asNumber ]
		  ifFalse: [ ratio + aNumber ]
]

{ #category : #arithmetic }
PartsPerFraction >> - aNumber [

	^ (aNumber isA: self class)
		  ifTrue: [ self class ratio: ratio - aNumber asNumber ]
		  ifFalse: [ ratio - aNumber ]
]

{ #category : #arithmetic }
PartsPerFraction >> / aNumber [

	^ ratio / aNumber asNumber
]

{ #category : #comparing }
PartsPerFraction >> < aNumber [

	^ ratio < aNumber asNumber
]

{ #category : #comparing }
PartsPerFraction >> = aNumber [

	^ aNumber isNumber and: [ self asNumber = aNumber asNumber ]
]

{ #category : #converting }
PartsPerFraction >> asFloat [

	^ ratio asFloat
]

{ #category : #converting }
PartsPerFraction >> asFraction [

	^ ratio asFraction
]

{ #category : #converting }
PartsPerFraction >> asNumber [

	^ ratio
]

{ #category : #hash }
PartsPerFraction >> hash [

	^ ratio hash
]

{ #category : #initialization }
PartsPerFraction >> initializeRatio: aRatio [

	ratio := aRatio 
]

{ #category : #arithmetic }
PartsPerFraction >> negated [

	^ self class ratio: ratio negated
]

{ #category : #arithmetic }
PartsPerFraction >> nthRoot: aPositiveInteger [

	^ ratio nthRoot: aPositiveInteger
]

{ #category : #arithmetic }
PartsPerFraction >> reciprocal [

	^ self class ratio: ratio reciprocal
]

{ #category : #arithmetic }
PartsPerFraction >> round: numberOfWishedDecimal [

	^ ratio round: numberOfWishedDecimal
]

{ #category : #arithmetic }
PartsPerFraction >> sqrt [

	^ ratio sqrt
]

{ #category : #private }
PartsPerFraction >> storeValueOn: aStream [

	self value printOn: aStream
]

{ #category : #evaluating }
PartsPerFraction >> value [

	^ratio * self class fraction 
]
