tests-arithmetic-API
testDivisionWithFractions

	self
		assert: Percentage zero / (1 / 2) equals: 0;
		should: [ (1 / 2) / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / (3 / 4) equals: 4 / 3;
		assert: (3 / 4) / Percentage oneHundred equals: 3 / 4;
		assert: (Percentage of: 50) / (3 / 4) equals: 2 / 3;
		assert: (3 / 4) / (Percentage of: 50) equals: 3 / 2