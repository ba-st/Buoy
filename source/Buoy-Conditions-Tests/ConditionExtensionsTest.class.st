"
I'm an unit test for extensions included in the Conditions package
"
Class {
	#name : #ConditionExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Conditions-Tests'
}

{ #category : #tests }
ConditionExtensionsTest >> testBlockUnless [

	| blockWasEvaluated |

	blockWasEvaluated := false.

	[ blockWasEvaluated := true ] unless: false.

	self assert: blockWasEvaluated.

	[ self fail ] unless: true
]

{ #category : #tests }
ConditionExtensionsTest >> testBlockUnlessInSuchCase [

	| collection result |

	collection := #().

	result := [ self fail ] unless: collection isEmpty inSuchCase: [ 0 ].

	self assert: result equals: 0.

	collection := #(2 3 4).

	result := [ collection first ] unless: collection isEmpty inSuchCase: [ self fail ].

	self assert: result equals: 2
]

{ #category : #tests }
ConditionExtensionsTest >> testBooleanThen [

	| blockWasEvaluated |

	blockWasEvaluated := false.

	true then: [ blockWasEvaluated := true ].

	self assert: blockWasEvaluated.

	false then: [ self fail ]
]

{ #category : #tests }
ConditionExtensionsTest >> testBooleanThenOtherwise [

	| blockWasEvaluated |

	blockWasEvaluated := true then: [ true ] otherwise: [ self fail ].

	self assert: blockWasEvaluated.

	blockWasEvaluated := false then: [ self fail ] otherwise: [ true ].

	self assert: blockWasEvaluated
]
