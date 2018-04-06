Extension { #name : #Number }

{ #category : #'*Buoy-Math' }
Number >> decreasedBy: aPercentage [

	AssertionChecker
		enforce: [ aPercentage between: 0 and: 1 ]
		because: 'A number can''t be decreased by a percentage greater than 100% and lesser than 0%'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred - aPercentage)
]

{ #category : #'*Buoy-Math' }
Number >> increasedBy: aPercentage [

	AssertionChecker
		enforce: [ aPercentage positive ]
		because: 'A number can''t be increased by a negative percentage'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred + aPercentage)
]

{ #category : #'*Buoy-Math' }
Number >> isPercentage [

	^false
]

{ #category : #'*Buoy-Math' }
Number >> perMille [

	^ PerMille of: self
]

{ #category : #'*Buoy-Math' }
Number >> percent [

	^ Percentage of: self
]
