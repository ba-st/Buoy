"
I'm a collection formatter allowing format a collection separating its elements with a provided separator. I allow to use a diferent separator for the last element and also a block to perform a element specific formatting.

Implementation Notes:
	I use a index to detect the last element and use the specific separator if present.
"
Class {
	#name : #CollectionFormatter,
	#superclass : #Object,
	#instVars : [
		'separator',
		'elementFormatter',
		'lastSeparator'
	],
	#category : 'Buoy-Collections'
}

{ #category : #'instance creation' }
CollectionFormatter class >> separatingWith: aSeparator [

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: Optional unused
		applyingToEach: [ :element | element asString ]
]

{ #category : #'instance creation' }
CollectionFormatter class >> separatingWith: aSeparator andLastWith: aLastSeparator [

	^ self
		separatingWith: aSeparator
		andLastWith: aLastSeparator
		applyingToEach: [ :element | element asString ]
]

{ #category : #'instance creation' }
CollectionFormatter class >> separatingWith: aSeparator andLastWith: aLastSeparator applyingToEach: anElementFormatter [

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: (Optional containing: aLastSeparator)
		applyingToEach: anElementFormatter
]

{ #category : #private }
CollectionFormatter class >> separatingWith: aSeparator andOptionallyLastWith: anOptionalSeparator applyingToEach: anElementFormatter [

	^ self new
		initializeSeparatingEachWith: aSeparator
		andOptionallyLastWith: anOptionalSeparator
		applyingToEach: anElementFormatter
]

{ #category : #'instance creation' }
CollectionFormatter class >> separatingWith: aSeparator applyingToEach: anElementFormatter [

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: Optional unused
		applyingToEach: anElementFormatter
]

{ #category : #formatting }
CollectionFormatter >> format: aCollection [

	 ^ self format:  aCollection on: (WriteStream on: String new)
]

{ #category : #formatting }
CollectionFormatter >> format: aCollection on: aStream [

	| index size |

	index := 1.
	size := aCollection size.

	aCollection
		do: [ :element | 
			index := index + 1.
			aStream nextPutAll: (elementFormatter value: element) ]
		separatedBy: [ index = size
				ifTrue: [ lastSeparator
						withContentDo: [ :content | self put: content on: aStream ]
						ifUnused: [ self putSeparatorOn: aStream ] ]
				ifFalse: [ self putSeparatorOn: aStream ] ].
			
	^aStream contents
]

{ #category : #initialization }
CollectionFormatter >> initializeSeparatingEachWith: aSeparator andOptionallyLastWith: anOptional applyingToEach: aBlock [

	separator := aSeparator.
	lastSeparator := anOptional.
	elementFormatter := aBlock
]

{ #category : #formatting }
CollectionFormatter >> put: aSeparator on: aStream [

	^ aStream
		nextPut: Character space;
		nextPut: aSeparator;
		nextPut: Character space
]

{ #category : #formatting }
CollectionFormatter >> putSeparatorOn: aStream [

	^ aStream
		nextPut: separator;
		nextPut: Character space
]
