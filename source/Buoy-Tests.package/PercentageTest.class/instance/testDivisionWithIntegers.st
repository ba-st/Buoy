tests-arithmetic-API
testDivisionWithIntegers

	self
		assert: Percentage zero / 100 equals: 0;
		should: [ 100 / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / 5 equals: 1 / 5;
		assert: 5 / Percentage oneHundred equals: 5;
		assert: (Percentage of: 50) / 5 equals: 1 / 10;
		assert: 5 / (Percentage of: 50) equals: 10