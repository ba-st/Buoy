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
		'lastSeparatorOptional'
	],
	#category : #'Buoy-Collections'
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

	^ super new
		initializeSeparatingEachWith: aSeparator asString
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

	^ String streamContents: [ :stream | self format: aCollection on: stream ]
]

{ #category : #formatting }
CollectionFormatter >> format: aCollection on: aStream [

	| index size |

	index := 1.
	size := aCollection size.

	aCollection
		do: [ :element | 
			index := index + 1.
			aStream nextPutAll: ( elementFormatter value: element )
			]
		separatedBy: [ [ aStream nextPutAll: separator ]
				unless: index = size
				inWhichCase: [ lastSeparatorOptional
						withContentDo: [ :content | aStream nextPutAll: content ]
						ifUnused: [ aStream nextPutAll: separator ]
					]
			]
]

{ #category : #initialization }
CollectionFormatter >> initializeSeparatingEachWith: aSeparator andOptionallyLastWith: anOptional applyingToEach: aBlock [

	separator := aSeparator.
	lastSeparatorOptional := anOptional.
	elementFormatter := aBlock
]
