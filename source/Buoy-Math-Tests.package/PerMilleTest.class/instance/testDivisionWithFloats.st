tests-arithmetic-API
testDivisionWithFloats

	self
		assert: 0 perMille / 100.0 equals: 0.0;
		should: [ 100.0 / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / 5.0 equals: 0.2;
		assert: 5.0 / 1000 perMille equals: 5.0;
		assert: (PerMille of: 500) / 5.0 equals: 0.1;
		assert: 5.0 / (PerMille of: 500) equals: 10.0