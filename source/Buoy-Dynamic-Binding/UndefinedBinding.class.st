"
I represent  an unbound object and will raise an error when asked about my contents
"
Class {
	#name : #UndefinedBinding,
	#superclass : #Binding,
	#instVars : [
		'errorClass',
		'explanations'
	],
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'Instance Creation' }
UndefinedBinding class >> explainedByAll: anExplanationCollection raising: anErrorClass [

	^ self new initializeExplainedByAll: anExplanationCollection raising: anErrorClass
]

{ #category : #Accessing }
UndefinedBinding >> content [

		^errorClass signalAll: explanations 
]

{ #category : #initialize }
UndefinedBinding >> initializeExplainedByAll: anExplanationCollection raising: anErrorClass [

	explanations := anExplanationCollection.
	errorClass := anErrorClass
]
