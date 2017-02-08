tests-arithmetic-API
testDivisionWithFloats

	self
		assert: Percentage zero / 100.0 equals: 0.0;
		should: [ 100.0 / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / 5.0 equals: 0.2;
		assert: 5.0 / Percentage oneHundred equals: 5.0;
		assert: (Percentage of: 50) / 5.0 equals: 0.1;
		assert: 5.0 / (Percentage of: 50) equals: 10.0