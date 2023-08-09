Extension { #name : #PerMille }

{ #category : #'*Buoy-Math-GS64-Extensions' }
PerMille >> printOn: stream [

	super printOn: stream.
	stream nextPutAll: '‰'
]
