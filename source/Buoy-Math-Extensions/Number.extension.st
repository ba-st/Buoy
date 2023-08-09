Extension { #name : #Number }

{ #category : #'*Buoy-Math-Extensions' }
Number >> decreasedBy: aPercentage [

	AssertionChecker
		enforce: [ aPercentage between: 0 and: 1 ]
		because: 'A number can''t be decreased by a percentage greater than 100% and lesser than 0%'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred - aPercentage)
]

{ #category : #'*Buoy-Math-Extensions' }
Number >> increasedBy: aPercentage [

	AssertionChecker
		enforce: [ aPercentage positive ]
		because: 'A number can''t be increased by a negative percentage'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred + aPercentage)
]

{ #category : #'*Buoy-Math-Extensions' }
Number >> isPercentage [

	^false
]

{ #category : #'*Buoy-Math-Extensions' }
Number >> perMille [

	^ PerMille of: self
]

{ #category : #'*Buoy-Math-Extensions' }
Number >> percent [

	^ Percentage of: self
]
