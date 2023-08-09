Extension { #name : #PartsPerFraction }

{ #category : #'*Buoy-Math-GS64-Extensions' }
PartsPerFraction >> _coerce: aNumber [

	^self class ratio: (ratio _coerce: aNumber)
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
PartsPerFraction >> _generality [

	^ ratio _generality + 1
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
PartsPerFraction >> printOn: stream [

	self value printOn: stream
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
PartsPerFraction >> printString [

	^ String streamContents: [ :stream | self printOn: stream ]
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
PartsPerFraction >> storeValueOn: aStream [

	self value printOn: aStream
]
