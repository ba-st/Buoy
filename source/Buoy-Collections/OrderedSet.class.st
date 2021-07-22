"
I'm a Set preserving the insertion order of my elements. 
"
Class {
	#name : #OrderedSet,
	#superclass : #SequenceableCollection,
	#instVars : [
		'collection'
	],
	#category : #'Buoy-Collections'
}

{ #category : #'instance creation' }
OrderedSet class >> new [

	^self new: 0
]

{ #category : #'instance creation' }
OrderedSet class >> new: size [

	^self basicNew initialize: size
]

{ #category : #'instance creation' }
OrderedSet class >> newFrom: aCollection [

	^ self withAll: aCollection
]

{ #category : #copying }
OrderedSet >> , aCollection [

	^ ( self species withAll: collection )
		  addAll: aCollection;
		  yourself
]

{ #category : #comparing }
OrderedSet >> = anObject [

	^ self equalityChecker check: self against: anObject
]

{ #category : #adding }
OrderedSet >> add: newObject [

	[ collection add: newObject ] unless: ( self includes: newObject ).
	^ newObject
]

{ #category : #converting }
OrderedSet >> asOrderedSet [

	^ self
]

{ #category : #accessing }
OrderedSet >> at: index [

	^ collection at: index
]

{ #category : #accessing }
OrderedSet >> at: index put: newObject [

	| newObjectIndex |

	newObjectIndex := self indexOf: newObject.
	AssertionChecker enforce: [ newObjectIndex = 0 or: [ newObjectIndex = index ] ]
		because: 'Can''t put an object already present in another index'
		raising: ConflictingObjectFound.

	^ collection at: index put: newObject
]

{ #category : #enumerating }
OrderedSet >> collect: aBlock [

	^ self species withAll: ( collection collect: aBlock )
]

{ #category : #copying }
OrderedSet >> copyFrom: start to: stop [

	^ self species withAll: ( collection copyFrom: start to: stop )
]

{ #category : #copying }
OrderedSet >> copyReplaceFrom: start to: stop with: replacementCollection [

	^ self species withAll: ( collection copyReplaceFrom: start to: stop with: replacementCollection )
]

{ #category : #copying }
OrderedSet >> copyWith: newElement [

	^ ( self includes: newElement ) 
		then: [ self copy ]
		otherwise: [ self species withAll: ( collection copyWith: newElement ) ]
]

{ #category : #enumerating }
OrderedSet >> difference: aCollection [

	^ self reject: [ :each | aCollection includes: each ]
]

{ #category : #copying }
OrderedSet >> grownBy: length [

	| currentSize grownCollection |

	currentSize := self size.
	grownCollection := collection grownBy: length
	
	"We need to put different objects in the grown collection,
	otherwise they will be wiped out as repetitions.".
	currentSize + 1 to: currentSize + length do: [ :index | grownCollection at: index put: Object new ].
	^ self species withAll: grownCollection
]

{ #category : #comparing }
OrderedSet >> hash [

	^ ( self equalityHashCombinator combineHashesOfAll: collection ) hashMultiply
]

{ #category : #initialization }
OrderedSet >> initialize: size [

	collection := OrderedCollection new: size
]

{ #category : #enumerating }
OrderedSet >> intersection: aCollection [

	^ aCollection inject: self species new into: [ :set :each | 
		  ( self includes: each ) ifTrue: [ set add: each ].
		  set
		  ]
]

{ #category : #enumerating }
OrderedSet >> occurrencesOf: anObject [

	^ ( self includes: anObject ) 
		  ifTrue: [ 1 ]
		  ifFalse: [ 0 ]
]

{ #category : #enumerating }
OrderedSet >> reject: aBlock [

	^ self species withAll: ( collection reject: aBlock )
]

{ #category : #removing }
OrderedSet >> remove: oldObject ifAbsent: anExceptionBlock [

	collection remove: oldObject ifAbsent: anExceptionBlock
]

{ #category : #removing }
OrderedSet >> removeAll [

	collection removeAll
]

{ #category : #converting }
OrderedSet >> reversed [

	^self species withAll: collection reversed
]

{ #category : #enumerating }
OrderedSet >> select: aBlock [

	^ self species withAll: ( collection select: aBlock )
]

{ #category : #accessing }
OrderedSet >> size [

	^ collection size
]

{ #category : #accessing }
OrderedSet >> swap: oneIndex with: anotherIndex [

	| oneElement anotherElement |

	oneElement := self at: oneIndex.
	anotherElement := self at: anotherIndex 
	
	"We need to temporarily put another thing in the second index
	because this collection doesn't allow duplicates.".
	self at: anotherIndex put: Object new.
	
	self at: oneIndex put: anotherElement.
	self at: anotherIndex put: oneElement
]

{ #category : #enumerating }
OrderedSet >> union: aCollection [

	^ self copy
		  addAll: aCollection;
		  yourself
]
