"
I represent  a binding to some object, so I can return a content. 
"
Class {
	#name : #DefinedBinding,
	#superclass : #Binding,
	#instVars : [
		'content'
	],
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'Instance Creation' }
DefinedBinding class >> connectedTo: anObject [

	^ self new initializeConnectedTo: anObject
]

{ #category : #Accessing }
DefinedBinding >> content [

	^ content
]

{ #category : #initialize }
DefinedBinding >> initializeConnectedTo: anObject [

	content := anObject 
]

{ #category : #testing }
DefinedBinding >> isDefined [

	^ true 
]
