Extension { #name : 'SequenceableCollection' }

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> allButFirstDo: aBlock [

	2 to: self size do:
		[:index | aBlock value: (self at: index)]
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> allButLastDo: block [

	1 to: self size - 1 do:
		[:index | block value: (self at: index)]
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> anyOne [

	^ self first
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> atRandom [

	^ self at: (Random new integerBetween: 1 and: self size)
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> copyAfter: anElement [
	"Answer a copy of the receiver from after the first occurrence
	of anElement up to the end. If no such element exists, answer
	an empty copy."

	^ self allButFirst: (self indexOf: anElement ifAbsent: [^ self copyEmpty])
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> endsWith: aSequenceableCollection [
	"Answer true if the receiver ends with the argument collection"

	| start |
	aSequenceableCollection ifEmpty: [ ^true ].
	(self size < aSequenceableCollection size) ifTrue: [^false].
	start := self size - aSequenceableCollection size.
	aSequenceableCollection withIndexDo: [:each :index | (self at: start + index) ~= each ifTrue: [^false]].
	^true
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> isSequenceable [

	^ true
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> pairsDo: aBlock [
	"Evaluate aBlock with my elements taken two at a time.  If there's an odd number of items,
	ignore the last one.  Allows use of a flattened array for things that naturally group into pairs."

	1 to: self size // 2 do: [ :index |
		aBlock value: (self at: 2 * index - 1) value: (self at: 2 * index) ]
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> removeAll [

	self ifNotEmpty: [ self removeFrom: 1 to: self size ]
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> split: aSequenceableCollection indicesDo: aBlock [
	"Perform an action specified as aBlock (with a start and end argument) to each of the indices of aSequenceableCollection that have been identified by taking the receiver as a splitter."

	| position oldPosition |
	position := 1.
	oldPosition := position.
	position := aSequenceableCollection indexOfSubCollection: self startingAt: position.

	[ position > 0 ] whileTrue: [
		aBlock value: oldPosition value: position - 1.
		position := position + self size.
		oldPosition := position.
		position := aSequenceableCollection indexOfSubCollection: self startingAt: position.
	].

	aBlock value: oldPosition value: aSequenceableCollection size
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> withIndexCollect: elementAndIndexBlock [
	"Just like with:collect: except that the iteration index supplies the second argument to the block."

	| result |
	result := self species new: self size.
	1 to: self size do:
		[:index | result at: index put:
		(elementAndIndexBlock
			value: (self at: index)
			value: index)].
	^ result
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> writeStream [
	^ WriteStream on: self
]
