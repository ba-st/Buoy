"
I'm an abstract  class representing the fact that some object can be optional.  I provide protocol to be combined with other optionals.
"
Class {
	#name : #Optional,
	#superclass : #Object,
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'Instance Creation' }
Optional class >> containing: anObject [

	^UsedOptional containing: anObject 
]

{ #category : #'Instance Creation' }
Optional class >> unused [

	^self unusedBecauseAll: #()
]

{ #category : #'Instance Creation' }
Optional class >> unusedBecause: anExplanation [

	^self unusedBecauseAll: { anExplanation }
]

{ #category : #'Instance Creation' }
Optional class >> unusedBecauseAll: anExplanationCollection [ 
	
	^UnusedOptional explainedByAll: anExplanationCollection 
]

{ #category : #'Instance Creation' }
Optional class >> whenAllUsedIn: optionals injectInto: aDyadicBlock [

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst injectInto: aDyadicBlock ] ifEmpty: [ self unused ]
]

{ #category : #'Instance Creation' }
Optional class >> whenAllUsedIn: optionals return: aMonadycBlock [

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst return: aMonadycBlock ] ifEmpty: [ self unused ]
]

{ #category : #'Instance Creation' }
Optional class >> withUsedOnlyIn: optionals injectInto: aDyadicBlock [

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst injectInto: aDyadicBlock ]
		ifEmpty: [ self unused ]
]

{ #category : #'Instance Creation' }
Optional class >> withUsedOnlyIn: optionals return: aMonadycBlock [

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst return: aMonadycBlock ]
		ifEmpty: [ self unused ]
]

{ #category : #Combining }
Optional >> return: aMonadycBlock [

	self subclassResponsibility 
]

{ #category : #Combining }
Optional >> whenAllUsedIn: optionals injectInto: aDyadicBlock [

	^ optionals inject: self into: [ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenBothUsedReturn: aDyadicBlock ]
]

{ #category : #Combining }
Optional >> whenAllUsedIn: optionals return: aMonadycBlock [

	self subclassResponsibility 
]

{ #category : #Combining }
Optional >> with: anOptional whenAnyUsedReturn: aDyadicBlock [

	self subclassResponsibility 
]

{ #category : #Combining }
Optional >> with: anOptional whenBothUsedReturn: aDyadicBlock [

	self subclassResponsibility 
]

{ #category : #Accessing }
Optional >> withContentDo: aMonadycBlock [

	self withContentDo: aMonadycBlock ifUnused: [  ]
]

{ #category : #Accessing }
Optional >> withContentDo: aMonadycBlock ifUnused: aNothingBlock [

	self subclassResponsibility 
]

{ #category : #Combining }
Optional >> withUsedOnlyIn: optionals injectInto: aDyadicBlock [

	^ optionals
		inject: self
		into:
			[ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenAnyUsedReturn: aDyadicBlock ]
]

{ #category : #Combining }
Optional >> withUsedOnlyIn: optionals return: aMonadycBlock [

	self subclassResponsibility 
]
