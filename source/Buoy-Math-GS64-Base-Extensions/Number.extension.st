Extension { #name : #Number }

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> asNumber [

	^ self
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> closeTo: num [
	"Tell whether the receiver and arguments are close from each."

	^ self asFloat closeTo: num
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> isInteger [

	^ false
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> isNaN [
	^ false
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> isZero [

	^ self = 0
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> nthRoot: aPositiveInteger [

	^ self raisedTo: aPositiveInteger reciprocal
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number class >> readFrom: aStringOrStream ifFail: aBlock [

	^ [
	  | stream |

	  stream := aStringOrStream isString
		            ifTrue: [ aStringOrStream readStream ]
		            ifFalse: [ aStringOrStream ].
	  self fromStream: stream
	  ]
		  on: ImproperOperation
		  do: [ :error | error return: aBlock value ]
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> round: numberOfWishedDecimal [

	^ self roundTo: (10 raisedTo: numberOfWishedDecimal negated)
]
