"
I'm a checker used to compare sequenceable collections.
"
Class {
	#name : #SequenceableCollectionEqualityChecker,
	#superclass : #EqualityChecker,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Buoy-Comparison'
}

{ #category : #'instance creation' }
SequenceableCollectionEqualityChecker class >> new [

	uniqueInstance ifNil: [ uniqueInstance := super new ].
	^ uniqueInstance
]

{ #category : #testing }
SequenceableCollectionEqualityChecker >> check: base against: target [

	^ ( self is: base identicalTo: target ) or: [ 
		  base isSequenceable and: [ 
			  target isCollection and: [ 
				  target isSequenceable and: [ self has: base theSameElementsThan: target ] ]
			  ]
		  ]
]

{ #category : #private }
SequenceableCollectionEqualityChecker >> has: base theSameElementsThan: target [

	^ base size = target size
		and: [ base
				with: target
				do: [ :first :second | 
					first = second
						ifFalse: [ ^ false ]
					].
			true
			]
]
