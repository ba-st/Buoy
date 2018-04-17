"
I represent an assertion failure policy that applies to some asserter. My purpose is to define how to handle an assertion failure.
"
Class {
	#name : #AssertionFailurePolicy,
	#superclass : #Object,
	#category : 'Buoy-Assertions'
}

{ #category : #Accessing }
AssertionFailurePolicy class >> defaultErrorToSignal [

	^ AssertionFailed
]

{ #category : #'Instance Creation' }
AssertionFailurePolicy class >> raising: anErrorClass [

	^ self subclassResponsibility
]

{ #category : #applying }
AssertionFailurePolicy >> applyTo: anAsserter [

	anAsserter checkApplying: self
]

{ #category : #notifying }
AssertionFailurePolicy >> assertionFailedBecause: aFailureExplanation [ 

	self subclassResponsibility
]
