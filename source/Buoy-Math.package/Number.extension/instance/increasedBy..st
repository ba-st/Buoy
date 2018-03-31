*Buoy-Math
increasedBy: aPercentage

	AssertionChecker
		enforce: [ aPercentage positive ]
		because: 'A number can''t be increased by a negative percentage'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred + aPercentage)