"
I'm an abstract  class representing the fact that some object can be optional.  I provide protocol to be combined with other optionals.
"
Class {
	#name : #Optional,
	#superclass : #Object,
	#category : #'Buoy-Dynamic-Binding'
}

{ #category : #'instance creation' }
Optional class >> containing: anObject [

	^UsedOptional containing: anObject 
]

{ #category : #'instance creation' }
Optional class >> unused [

	^self unusedBecauseAll: #()
]

{ #category : #'instance creation' }
Optional class >> unusedBecause: anExplanation [

	^self unusedBecauseAll: { anExplanation }
]

{ #category : #'instance creation' }
Optional class >> unusedBecauseAll: anExplanationCollection [ 
	
	^UnusedOptional explainedByAll: anExplanationCollection 
]

{ #category : #'instance creation' }
Optional class >> whenAllUsedIn: optionals injectInto: aDyadicBlock [

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst injectInto: aDyadicBlock ] ifEmpty: [ self unused ]
]

{ #category : #'instance creation' }
Optional class >> whenAllUsedIn: optionals return: aMonadycBlock [

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst return: aMonadycBlock ] ifEmpty: [ self unused ]
]

{ #category : #'instance creation' }
Optional class >> withUsedOnlyIn: optionals injectInto: aDyadicBlock [

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst injectInto: aDyadicBlock ]
		ifEmpty: [ self unused ]
]

{ #category : #'instance creation' }
Optional class >> withUsedOnlyIn: optionals return: aMonadycBlock [

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst return: aMonadycBlock ]
		ifEmpty: [ self unused ]
]

{ #category : #comparing }
Optional >> = anObject [

	^ self equalityChecker
		compareWith: [ :base :target | base equalsTo: target ];
		checkAgainst: anObject
]

{ #category : #private }
Optional >> equalsTo: anObject [

	^ self subclassResponsibility
]

{ #category : #comparing }
Optional >> hash [

	^ self
		withContentDo: [ :content | content hash ]
		ifUnused: [ :explanations | explanations hash ]
]

{ #category : #combining }
Optional >> return: aMonadycBlock [

	self subclassResponsibility 
]

{ #category : #combining }
Optional >> whenAllUsedIn: optionals injectInto: aDyadicBlock [

	^ optionals inject: self into: [ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenBothUsedReturn: aDyadicBlock ]
]

{ #category : #combining }
Optional >> whenAllUsedIn: optionals return: aMonadycBlock [

	self subclassResponsibility 
]

{ #category : #combining }
Optional >> with: anOptional whenAnyUsedReturn: aDyadicBlock [

	self subclassResponsibility 
]

{ #category : #combining }
Optional >> with: anOptional whenBothUsedReturn: aDyadicBlock [

	self subclassResponsibility 
]

{ #category : #accessing }
Optional >> withContentDo: aMonadycBlock [

	self withContentDo: aMonadycBlock ifUnused: [  ]
]

{ #category : #accessing }
Optional >> withContentDo: aMonadycBlock ifUnused: aNothingBlock [

	self subclassResponsibility 
]

{ #category : #combining }
Optional >> withUsedOnlyIn: optionals injectInto: aDyadicBlock [

	^ optionals
		inject: self
		into:
			[ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenAnyUsedReturn: aDyadicBlock ]
]

{ #category : #combining }
Optional >> withUsedOnlyIn: optionals return: aMonadycBlock [

	self subclassResponsibility 
]
