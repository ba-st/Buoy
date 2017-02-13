tests-arithmetic-API
testDivisionWithIntegers

	self
		assert: 0 perMille / 100 equals: 0;
		should: [ 100 / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / 5 equals: 1 / 5;
		assert: 5 / 1000 perMille equals: 5;
		assert: 500 perMille / 5 equals: 1 / 10;
		assert: 5 / 500 perMille equals: 10