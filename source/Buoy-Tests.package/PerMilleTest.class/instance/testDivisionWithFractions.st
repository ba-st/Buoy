tests-arithmetic-API
testDivisionWithFractions

	self
		assert: 0 perMille  / (1 / 2) equals: 0;
		should: [ (1 / 2) / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / (3 / 4) equals: 4 / 3;
		assert: (3 / 4) / 1000 perMille equals: 3 / 4;
		assert: 500 perMille / (3 / 4) equals: 2 / 3;
		assert: (3 / 4) / 500 perMille equals: 3 / 2