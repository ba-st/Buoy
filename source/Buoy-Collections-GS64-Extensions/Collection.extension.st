Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> anyOne [

	^ self any
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> as: aSimilarClass [
	"Create an object of class aSimilarClass that has similar contents to the receiver if the object is not already an instance of this class."

	aSimilarClass == self class ifTrue: [ ^ self ].

	^ aSimilarClass newFrom: self
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> collect: aBlock as: aClass [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Collect the resulting values into an instance of aClass. Answer the resulting collection."

	^(aClass new: self size) fillFrom: self with: aBlock
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> count: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the number of elements that answered true."

	| sum |
	sum := 0.
	self do: [ :each | (aBlock value: each) ifTrue: [ sum := sum + 1 ] ].
	^ sum
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> detect: aBlock ifFound: foundBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If some element evaluates aBlock to true, then cull this element into
	foundBlock.
	If no element matches the criteria then do nothing.
	Always returns self to avoid misuse and a potential isNil check on the sender."

	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ "Do nothing on purpose" ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If some element evaluates aBlock to true, then cull this element into
	foundBlock and answer the result of this evaluation.
	If none evaluate to true, then evaluate exceptionBlock."

	self do: [ :each |
		(aBlock value: each) ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> fillFrom: aCollection with: aBlock [
	"Private.
	Evaluate aBlock with each of aCollections's elements as the argument.
	Collect the resulting values into self. Answer self."

	aCollection do: [ :each |
		self add: (aBlock value: each) ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [

	^ self isEmpty
		  ifTrue: emptyBlock
		  ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> isSequenceable [

	^ false
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection class >> newFrom: aCollection [
	"Answer an instance of me containing the same elements as aCollection."

	| newCollection |
	newCollection := self new: aCollection size.
	newCollection addAll: aCollection.
	^ newCollection
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> select: selectBlock thenCollect: collectBlock [

	^ (self select: selectBlock) collect: collectBlock
]
