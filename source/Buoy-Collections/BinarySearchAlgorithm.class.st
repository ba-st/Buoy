"
I'm an algorithm implementing Binary Search against a sequenceable collection, I will return the insertion index for the provided search key.

Instance Variables
	collection:		<SequenceableCollection> 
		collection is expected to be sorted, I don't check that because it's too costly.
		It's not neccesary that collection be a SortedCollection, only that the elements are sorted against the search key.	
	searchKey:		<Object>
	searchKeyBlock:	<Valuable>
	start:				<Integer>
	stop:				<Integer>

"
Class {
	#name : #BinarySearchAlgorithm,
	#superclass : #Object,
	#instVars : [
		'start',
		'stop',
		'searchKeyBlock',
		'collection',
		'searchKey'
	],
	#category : #'Buoy-Collections'
}

{ #category : #private }
BinarySearchAlgorithm class >> defaultStartIndex [

	^ 1
]

{ #category : #'instance creation' }
BinarySearchAlgorithm class >> searchFor: aKey in: aCollection from: theStart to: theEnd using: aMonadycBlock [

	^ self new
		initializeSearchFor: aKey
		in: aCollection
		from: theStart
		to: theEnd
		using: aMonadycBlock
]

{ #category : #'instance creation' }
BinarySearchAlgorithm class >> searchFor: aKey in: aCollection from: startIndex using: aMonadycBlock [

	^ self
		searchFor: aKey
		in: aCollection
		from: startIndex
		to: aCollection size
		using: aMonadycBlock
]

{ #category : #'instance creation' }
BinarySearchAlgorithm class >> searchFor: aKey in: aCollection using: aMonadycBlock [

	^ self
		searchFor: aKey
		in: aCollection
		from: self defaultStartIndex
		using: aMonadycBlock
]

{ #category : #execution }
BinarySearchAlgorithm >> execute [

	| middleIndex lowIndex highIndex |

	lowIndex := start.
	highIndex := stop.
	[ lowIndex <= highIndex ]
		whileTrue: [ middleIndex := ( lowIndex + highIndex ) // 2.
			( searchKeyBlock value: ( collection at: middleIndex ) ) <= searchKey
				ifTrue: [ lowIndex := middleIndex + 1 ]
				ifFalse: [ highIndex := middleIndex - 1 ]
			].
	^ lowIndex
]

{ #category : #initialization }
BinarySearchAlgorithm >> initializeSearchFor: aKey in: aCollection from: theStart to: theEnd using: aMonadycBlock [

	start := theStart.
	stop := theEnd.
	searchKeyBlock := aMonadycBlock.
	collection := aCollection.
	searchKey := aKey
]
