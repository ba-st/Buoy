"
I'm a builder for  Assertion Checkers.
"
Class {
	#name : #AssertionCheckerBuilder,
	#superclass : #Object,
	#instVars : [
		'asserter',
		'failurePolicyFactory',
		'errorToSignal'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #'instance creation' }
AssertionCheckerBuilder class >> new [

	^ super new initialize
]

{ #category : #checking }
AssertionCheckerBuilder >> build [

	^ AssertionChecker applying: (failurePolicyFactory raising: errorToSignal) to: asserter
]

{ #category : #checking }
AssertionCheckerBuilder >> buildAndCheck [

	self build check
]

{ #category : #configuring }
AssertionCheckerBuilder >> checking: aMonadycBlock [

	aMonadycBlock value: asserter 
]

{ #category : #configuring }
AssertionCheckerBuilder >> failFast [

	failurePolicyFactory := RaiseOnFirstAssertionFailurePolicy
]

{ #category : #initialization }
AssertionCheckerBuilder >> initialize [

	super initialize.
	asserter := Asserter new.
	self raising: AssertionFailurePolicy defaultErrorToSignal.
	failurePolicyFactory := CollectingAssertionFailuresPolicy
]

{ #category : #configuring }
AssertionCheckerBuilder >> raising: anErrorToSignal [

	errorToSignal := anErrorToSignal
]
