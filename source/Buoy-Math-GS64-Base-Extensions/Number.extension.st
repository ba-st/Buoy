Extension { #name : #Number }

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> asNumber [

	^ self
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> isInteger [

	^ false
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> isZero [

	^ self = 0
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> round: numberOfWishedDecimal [

	^ self roundTo: (10 raisedTo: numberOfWishedDecimal negated)
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Number >> storeOn: aStream [

	self printOn: aStream
]
