*Buoy
decreasedBy: aPercentage

	AssertionChecker
		enforce: [ aPercentage between: 0 and: 1 ]
		because: 'A number can''t be decreased by a percentage greater than 100% and lesser than 0%'
		raising: ArithmeticError.

	^ self * (Percentage oneHundred - aPercentage)