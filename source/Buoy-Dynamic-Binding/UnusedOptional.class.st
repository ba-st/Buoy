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

{ #category : #'Instance Creation' }
UnusedOptional class >> explainedByAll: anExplanationCollection [

	^ self new initializeExplainedByAll: anExplanationCollection
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

{ #category : #Combining }
UnusedOptional >> return: aMonadycBlock [

	^ self
]

{ #category : #Combining }
UnusedOptional >> whenAllUsedIn: optionals return: aMonadycBlock [

	^ self whenAllUsedIn: optionals injectInto: [ :x :y |  ]
]

{ #category : #Combining }
UnusedOptional >> with: anOptional whenAnyUsedReturn: aBlockClosure [

	^ anOptional
		withContentDo: [ :foreignContent | anOptional ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]
]

{ #category : #Combining }
UnusedOptional >> with: anOptional whenBothUsedReturn: aBlockClosure [

	^ anOptional
		withContentDo: [ :foreignContent | self ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]
]

{ #category : #Accessing }
UnusedOptional >> withContentDo: aBlockClosure ifUnused: aNothingBlock [ 
	
	^aNothingBlock cull: explanations 
]

{ #category : #Combining }
UnusedOptional >> withUsedOnlyIn: optionals return: aMonadycBlock [

	^ self withUsedOnlyIn: optionals injectInto: [ :x :y |  ]
]
