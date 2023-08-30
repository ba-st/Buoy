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
BinaryFloat class >> infinity [

	^ PlusInfinity
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isFinite [
	"simple, byte-order independent test for rejecting Not-a-Number and (Negative)Infinity"

	^(self - self) = 0.0
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isInfinite [

	^ self isFinite not
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isNaN [
	"simple, byte-order independent test for Not-a-Number"

	^ self ~= self
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> nan [

	^ MinusQuietNaN
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> negativeInfinity [

	^ MinusInfinity
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> zero [
	^ 0.0
]
