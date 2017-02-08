tests-arithmetic-API
testDivisionWithScaledDecimals

	self
		assert: Percentage zero / 100.0s2 equals: 0.0s2;
		should: [ 100.0s2 / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / 5.0s2 equals: 0.2s2;
		assert: 5.0s2 / Percentage oneHundred equals: 5.0s2;
		assert: (Percentage of: 50) / 5.0s2 equals: 0.1s2;
		assert: 5.0s2 / (Percentage of: 50) equals: 10.0s2