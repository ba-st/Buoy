Extension { #name : #BinaryFloat }

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> closeTo: num [
	"Tell whether the receiver and arguments are close from each."

	^ self closeTo: num precision: 0.0001
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> closeTo: num precision: aPrecision [
	"Tell whether the receiver and arguments are close from each other given a precision"

	num isNumber ifFalse: [ ^ false ].

	^ self = num asFloat or: [ (self - num) abs <= aPrecision ]
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isInfinite [

	^ self kind = #infinity
]
