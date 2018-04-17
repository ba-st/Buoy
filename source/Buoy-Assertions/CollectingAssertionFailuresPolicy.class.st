"
I'm an assertion policy that collect the failure explanations, and try to keep evaluating the following conditions.
"
Class {
	#name : #CollectingAssertionFailuresPolicy,
	#superclass : #AssertionFailurePolicy,
	#instVars : [
		'failures',
		'errorClass'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #'Instance Creation' }
CollectingAssertionFailuresPolicy class >> raising: anErrorClass [

	^ self new initializeRaising: anErrorClass
]

{ #category : #applying }
CollectingAssertionFailuresPolicy >> applyTo: anAsserter [

	super applyTo: anAsserter.
	failures ifNotEmpty: [ errorClass signalAll: failures ]
]

{ #category : #notifying }
CollectingAssertionFailuresPolicy >> assertionFailedBecause: aFailureExplanation [  

	failures add: aFailureExplanation
]

{ #category : #initialization }
CollectingAssertionFailuresPolicy >> initializeRaising: anErrorClass [

	errorClass := anErrorClass.
	failures := OrderedCollection new
]
