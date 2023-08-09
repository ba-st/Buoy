Extension { #name : #Percentage }

{ #category : #'*Buoy-Math-GS64-Extensions' }
Percentage >> printOn: stream [

	super printOn: stream.
	stream nextPut: $%
]
