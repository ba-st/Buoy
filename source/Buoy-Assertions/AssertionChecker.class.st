"
I'm representing an Assertion Checker. My main objetive is to check a set of preconfigured facts and signal an error if some of them are not satisfied.
"
Class {
	#name : #AssertionChecker,
	#superclass : #Object,
	#instVars : [
		'asserter',
		'failurePolicy'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #'instance creation' }
AssertionChecker class >> applying: aFailurePolicy to: anAsserter [

	^ self new initializeApplying: aFailurePolicy to: anAsserter
]

{ #category : #private }
AssertionChecker class >> checkApplyingFailFastPolicyTo: asserter raising: errorToSignal [

	^ (self applying: (RaiseOnFirstAssertionFailurePolicy raising: errorToSignal) to: asserter) check
]

{ #category : #checking }
AssertionChecker class >> enforce: aFact because: aStringOrBlockExplanation [

	^ self enforce: aFact because: aStringOrBlockExplanation raising: AssertionFailurePolicy defaultErrorToSignal 
]

{ #category : #checking }
AssertionChecker class >> enforce: aFact because: aStringOrBlockExplanation raising: errorToSignal [

	| asserter |

	asserter := Asserter new.
	asserter enforce: aFact because: aStringOrBlockExplanation.
	
	^ self checkApplyingFailFastPolicyTo: asserter raising: errorToSignal
]

{ #category : #checking }
AssertionChecker class >> refuse: aFact because: aStringOrBlockExplanation [

	^ self refuse: aFact because: aStringOrBlockExplanation raising: AssertionFailurePolicy defaultErrorToSignal
]

{ #category : #checking }
AssertionChecker class >> refuse: aFact because: aStringOrBlockExplanation raising: errorToSignal [

	| asserter |

	asserter := Asserter new.
	asserter refuse: aFact because: aStringOrBlockExplanation.

	^ self checkApplyingFailFastPolicyTo: asserter raising: errorToSignal
]

{ #category : #checking }
AssertionChecker >> check [

	failurePolicy applyTo: asserter
]

{ #category : #initialization }
AssertionChecker >> initializeApplying: aFailurePolicy to: anAsserter [

	failurePolicy := aFailurePolicy.
	asserter := anAsserter
]
