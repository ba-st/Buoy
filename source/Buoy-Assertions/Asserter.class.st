"
I'm a helper for Assertion Checker. Not intended to be used directly.
"
Class {
	#name : #Asserter,
	#superclass : #Object,
	#instVars : [
		'checks'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #private }
Asserter >> asReverseFact: aFact [

	^ [ aFact value not ]
]

{ #category : #Checking }
Asserter >> checkApplying: aPolicy [

	checks do: [ :check | check checkApplying: aPolicy ]
]

{ #category : #configuring }
Asserter >> enforce: aFact because: aStringOrBlock [

	checks add: (AssertionCheck checking: aFact onFailure: aStringOrBlock)
]

{ #category : #configuring }
Asserter >> enforce: aFact because: anExplanationStringOrBlock onSuccess: aSuccessAction [

	checks add: (AssertionCheck checking: aFact onSuccess: [ :policy | self value: aSuccessAction applying: policy ] onFailure: anExplanationStringOrBlock)
]

{ #category : #initialization }
Asserter >> initialize [

	super initialize.
	checks := OrderedCollection new
]

{ #category : #configuring }
Asserter >> refuse: aFact because: aStringOrBlock [

	self enforce: (self asReverseFact: aFact) because: aStringOrBlock
]

{ #category : #configuring }
Asserter >> refuse: aFact because: anExplanationStringOrBlock onSuccess: aSuccessAction [

	self enforce: (self asReverseFact: aFact) because: anExplanationStringOrBlock onSuccess: aSuccessAction
]

{ #category : #private }
Asserter >> value: aSuccessAction applying: policy [

	| asserter |

	asserter := self class new.
	aSuccessAction value: asserter.
	asserter checkApplying: policy
]
