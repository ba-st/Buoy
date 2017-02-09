tests
testDecreasedBy

	self
		assert: (1000 decreasedBy: 60 percent) equals: 400;
		assert: (200 decreasedBy: Percentage oneHundred) equals: 0;
		should: [ 143 decreasedBy: 101 percent ] raise: ArithmeticError;
		should: [ 1 decreasedBy: -1 percent ] raise: ArithmeticError