"
I'm an optional representing the missing objects. I provide a list of explanations to aid the users.
"
Class {
	#name : #UnusedOptional,
	#superclass : #Optional,
	#instVars : [
		'explanations'
	],
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'instance creation' }
UnusedOptional class >> explainedByAll: anExplanationCollection [

	^ self new initializeExplainedByAll: anExplanationCollection
]

{ #category : #private }
UnusedOptional >> equalsTo: anObject [

	^ anObject
		withContentDo: [ :anotherContent | false ]
		ifUnused: [ :anotherExplanations | explanations = anotherExplanations ]
]

{ #category : #initialization }
UnusedOptional >> initializeExplainedByAll: anExplanationCollection [

	explanations := anExplanationCollection
]

{ #category : #printing }
UnusedOptional >> printOn: aStream [

	explanations
		do: [ :explanation | aStream nextPutAll: explanation ]
		separatedBy: [ aStream
				nextPut: $.;
				space ]
]

{ #category : #combining }
UnusedOptional >> return: aMonadycBlock [

	^ self
]

{ #category : #combining }
UnusedOptional >> whenAllUsedIn: optionals return: aMonadycBlock [

	^ self whenAllUsedIn: optionals injectInto: [ :x :y |  ]
]

{ #category : #combining }
UnusedOptional >> with: anOptional whenAnyUsedReturn: aBlockClosure [

	^ anOptional
		withContentDo: [ :foreignContent | anOptional ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]
]

{ #category : #combining }
UnusedOptional >> with: anOptional whenBothUsedReturn: aBlockClosure [

	^ anOptional
		withContentDo: [ :foreignContent | self ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]
]

{ #category : #accessing }
UnusedOptional >> withContentDo: aBlockClosure ifUnused: aNothingBlock [ 
	
	^aNothingBlock cull: explanations 
]

{ #category : #combining }
UnusedOptional >> withUsedOnlyIn: optionals return: aMonadycBlock [

	^ self withUsedOnlyIn: optionals injectInto: [ :x :y |  ]
]
