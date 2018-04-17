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

{ #category : #'Instance Creation' }
UsedOptional class >> containing: anObject [

	^self new initializeContaining: anObject 
]

{ #category : #initialization }
UsedOptional >> initializeContaining: anObject [

	content := anObject 
]

{ #category : #printing }
UsedOptional >> printOn: aStream [

	aStream nextPutAll: content asString
]

{ #category : #Combining }
UsedOptional >> return: aMonadycBlock [

	^ self class containing: (aMonadycBlock value: content)
]

{ #category : #Combining }
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

{ #category : #Combining }
UsedOptional >> with: anOptional whenAnyUsedReturn: aDyadicBlock [

	^ anOptional
		withContentDo: [ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ self ]
]

{ #category : #Combining }
UsedOptional >> with: anOptional whenBothUsedReturn: aDyadicBlock [

	^ anOptional
		withContentDo:
			[ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ anOptional ]
]

{ #category : #Accessing }
UsedOptional >> withContentDo: aBlockClosure ifUnused: aNothingBlock [ 
	
	^aBlockClosure cull: content 
]

{ #category : #Combining }
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
