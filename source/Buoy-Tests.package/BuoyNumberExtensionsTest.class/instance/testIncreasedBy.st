tests
testIncreasedBy

	self
		assert: (1000 increasedBy: 100 percent) equals: 2000;
		assert: (200 increasedBy: 10 percent) equals: 220;
		should: [ 1 increasedBy: -1 percent ] raise: ArithmeticError