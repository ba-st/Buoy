"
I'm an optional containing some object
"
Class {
	#name : #UsedOptional,
	#superclass : #Optional,
	#instVars : [
		'content'
	],
	#category : 'Buoy-Dynamic-Binding'
}

{ #category : #'instance creation' }
UsedOptional class >> containing: anObject [

	^self new initializeContaining: anObject 
]

{ #category : #private }
UsedOptional >> equalsTo: anObject [

	^ anObject
		withContentDo: [ :anotherContent | content = anotherContent ]
		ifUnused: [ false ]
]

{ #category : #initialization }
UsedOptional >> initializeContaining: anObject [

	content := anObject 
]

{ #category : #printing }
UsedOptional >> printOn: aStream [

	aStream nextPutAll: content asString
]

{ #category : #combining }
UsedOptional >> return: aMonadycBlock [

	^ self class containing: (aMonadycBlock value: content)
]

{ #category : #combining }
UsedOptional >> whenAllUsedIn: optionals return: aMonadycBlock [

	| combined |

	combined := (self class containing: (OrderedCollection with: content))
		whenAllUsedIn: optionals
		injectInto: [ :contents :currentContent | 
			contents
				add: currentContent;
				yourself ].

	^ combined withContentDo: [ :contents | self class containing: (aMonadycBlock value: contents) ] ifUnused: [ combined ]
]

{ #category : #combining }
UsedOptional >> with: anOptional whenAnyUsedReturn: aDyadicBlock [

	^ anOptional
		withContentDo: [ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ self ]
]

{ #category : #combining }
UsedOptional >> with: anOptional whenBothUsedReturn: aDyadicBlock [

	^ anOptional
		withContentDo:
			[ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ anOptional ]
]

{ #category : #accessing }
UsedOptional >> withContentDo: aBlockClosure ifUnused: aNothingBlock [ 
	
	^aBlockClosure cull: content 
]

{ #category : #combining }
UsedOptional >> withUsedOnlyIn: optionals return: aMonadycBlock [

	| combined |

	combined := (self class containing: (OrderedCollection with: content))
		withUsedOnlyIn: optionals
		injectInto: [ :contents :currentContent | 
			contents
				add: currentContent;
				yourself ].

	^ combined withContentDo: [ :contents | self class containing: (aMonadycBlock value: contents) ] ifUnused: [ combined ]
]
