Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> anyOne [

	^ self any
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
