"
I'm an assertion policy that raises and exception on the first assertion failure (failing fast)
"
Class {
	#name : #RaiseOnFirstAssertionFailurePolicy,
	#superclass : #AssertionFailurePolicy,
	#instVars : [
		'errorClass'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #'Instance Creation' }
RaiseOnFirstAssertionFailurePolicy class >> raising: anErrorClass [

	^ self new initializeRaising: anErrorClass
]

{ #category : #notifying }
RaiseOnFirstAssertionFailurePolicy >> assertionFailedBecause: aFailureExplanation [

	errorClass signal: aFailureExplanation
]

{ #category : #initialization }
RaiseOnFirstAssertionFailurePolicy >> initializeRaising: anErrorClass [

	errorClass := anErrorClass
]
