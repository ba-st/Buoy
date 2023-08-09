Extension { #name : #BinaryFloat }

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isInfinite [

	^ self kind = #infinity
]
