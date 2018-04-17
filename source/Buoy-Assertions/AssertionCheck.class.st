"
I represent a check for a specific fact, including the success and failure actions to apply
"
Class {
	#name : #AssertionCheck,
	#superclass : #Object,
	#instVars : [
		'factToCheck',
		'explanationBlockOrString',
		'successAction'
	],
	#category : 'Buoy-Assertions'
}

{ #category : #'instance creation' }
AssertionCheck class >> checking: aFact onFailure: anExplanationBlockOrString [

	^ self checking: aFact onSuccess: [ :policy |  ] onFailure: anExplanationBlockOrString
]

{ #category : #'instance creation' }
AssertionCheck class >> checking: aFact onSuccess: aSuccessAction onFailure: anExplanationBlockOrString [

	^ self new initializeChecking: aFact onSuccess: aSuccessAction onFailure: anExplanationBlockOrString
]

{ #category : #Checking }
AssertionCheck >> checkApplying: anAssertionFailurePolicy [

	factToCheck value
		ifTrue: [ successAction value: anAssertionFailurePolicy ]
		ifFalse: [ anAssertionFailurePolicy assertionFailedBecause: self explanation ]
]

{ #category : #private }
AssertionCheck >> explanation [

	^ explanationBlockOrString value
]

{ #category : #initialize }
AssertionCheck >> initializeChecking: aFact onSuccess: aSuccessAction onFailure: aFailureBlockOrString [

	factToCheck := aFact.
	successAction := aSuccessAction.
	explanationBlockOrString := aFailureBlockOrString
]
