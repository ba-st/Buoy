Extension { #name : #Number }

{ #category : #'*Buoy-Math-GS64-Extensions' }
Number >> isInteger [

	^ false
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
Number >> isZero [

	^ self = 0
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
Number >> storeOn: aStream [

	self printOn: aStream
]
