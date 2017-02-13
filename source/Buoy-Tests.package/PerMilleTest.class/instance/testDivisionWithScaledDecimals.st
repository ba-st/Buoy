tests-arithmetic-API
testDivisionWithScaledDecimals

	self
		assert: 0 perMille / 100.0s2 equals: 0.0s2;
		should: [ 100.0s2 / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / 5.0s2 equals: 0.2s2;
		assert: 5.0s2 / 1000 perMille equals: 5.0s2;
		assert: 500 perMille / 5.0s2 equals: 0.1s2;
		assert: 5.0s2 / 500 perMille equals: 10.0s2