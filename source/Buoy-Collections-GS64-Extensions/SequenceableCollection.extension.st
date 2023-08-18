Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> anyOne [

	^ self first
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> atRandom [

	^ self at: (Random new integerBetween: 1 and: self size)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> copyAfter: anElement [
	"Answer a copy of the receiver from after the first occurrence
	of anElement up to the end. If no such element exists, answer
	an empty copy."

	^ self allButFirst: (self indexOf: anElement ifAbsent: [^ self copyEmpty])
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> endsWith: aSequenceableCollection [
	"Answer true if the receiver ends with the argument collection"

	| start |
	aSequenceableCollection ifEmpty: [ ^true ].
	(self size < aSequenceableCollection size) ifTrue: [^false].
	start := self size - aSequenceableCollection size.
	aSequenceableCollection withIndexDo: [:each :index | (self at: start + index) ~= each ifTrue: [^false]].
	^true
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> isSequenceable [

	^ true
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> removeAll [

	self ifNotEmpty: [ self removeFrom: 1 to: self size ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
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

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> writeStream [
	^ WriteStream on: self
]
