Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> anyOne [

	^ self any
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> collect: aBlock as: aClass [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Collect the resulting values into an instance of aClass. Answer the resulting collection."

	^(aClass new: self size) fillFrom: self with: aBlock
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
Collection >> select: selectBlock thenCollect: collectBlock [

	^ (self select: selectBlock) collect: collectBlock
]
