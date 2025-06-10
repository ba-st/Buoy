Extension { #name : 'BinaryFloat' }

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> closeTo: num [
	"Tell whether the receiver and arguments are close from each."

	^ self closeTo: num precision: self class defaultComparisonPrecision
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> closeTo: num precision: aPrecision [
	"Tell whether the receiver and arguments are close from each other given a precision"

	num isNumber ifFalse: [ ^ false ].

	^ self = num asFloat or: [ (self - num) abs <= aPrecision ]
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> defaultComparisonPrecision [

	"Default precision used for comparing two float numbers.
	Using value described in Numerical Recipes, 3rd edition, Section 5.7, which is pages 229-230
	corresponding to the square root of the machine epsilon: self epsilon sqrt"
	^ 1.4901161193847656e-8
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> infinity [

	^ PlusInfinity
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isFinite [

	^ #( #normal #subnormal #zero ) includes: self kind
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isInfinite [

	^ self kind = #infinity
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat >> isNaN [

	^ #( #quietNaN #signalingNaN ) includes: self kind
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> nan [

	^ MinusQuietNaN
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> negativeInfinity [

	^ MinusInfinity
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> readFrom: aStringOrStream [

	^ aStringOrStream isString
		  ifTrue: [ self fromString: aStringOrStream ]
		  ifFalse: [ self fromStream: aStringOrStream ]
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
BinaryFloat class >> zero [
	^ 0.0
]
