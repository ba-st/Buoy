"
I'm an abstract class representing a binding. 
"
Class {
	#name : #Binding,
	#superclass : #Object,
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'Instance Creation' }
Binding class >> to: anObject [

	^DefinedBinding connectedTo: anObject 
]

{ #category : #'Instance Creation' }
Binding class >> undefinedExplainedBy: anExplanation [

	^ self undefinedExplainedBy: anExplanation raising: AssertionFailed
]

{ #category : #'Instance Creation' }
Binding class >> undefinedExplainedBy: anExplanation raising: anErrorClass [

	^ self undefinedExplainedByAll: {anExplanation} raising: anErrorClass
]

{ #category : #'Instance Creation' }
Binding class >> undefinedExplainedByAll: anExplanationCollection raising: anErrorClass [

	^ UndefinedBinding explainedByAll: anExplanationCollection raising: anErrorClass
]

{ #category : #accessing }
Binding >> content [

	self subclassResponsibility 
]

{ #category : #testing }
Binding >> isDefined [

	^ self subclassResponsibility 
]
