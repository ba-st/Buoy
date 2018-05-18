"
I'm an interface declaring a set of messages to be understood by the objects implementing me.

I'm not intended to be used as some kind of static type check, but to document an expected protocol.
"
Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'name',
		'messages'
	],
	#category : #'Buoy-Metaprogramming'
}

{ #category : #'instance creation' }
Interface class >> named: aName declaring: aSelectorCollection [

	AssertionChecker refuse: [ aSelectorCollection isEmpty ] because: 'An interface must declare at least one message.' raising: InstanceCreationFailed.

	^ self new initializeNamed: aName declaring: aSelectorCollection
]

{ #category : #initialization }
Interface >> initializeNamed: aName declaring: aSelectorCollection [

	name := aName.
	messages := aSelectorCollection
]

{ #category : #testing }
Interface >> isImplementedBy: anObject [

	^ messages allSatisfy: [ :message | anObject respondsTo: message ]
]

{ #category : #testing }
Interface >> isImplementedByInstancesOf: aClass [

	^ messages allSatisfy: [ :message | aClass canUnderstand: message ]
]

{ #category : #printing }
Interface >> printOn: aStream [

	aStream nextPutAll: name
]
