tests-arithmetic-API
testProductWithFloats

	self
		assert: 0 perMille * 100.0 equals: 0.0;
		assert: 100.0 * 0 perMille equals: 0.0;
		assert: 1000 perMille * 5.0 equals: 5.0;
		assert: 5.0 * 1000 perMille equals: 5.0;
		assert: (PerMille of: 500.0) * 5.0 equals: 2.5;
		assert: 5.0 * (PerMille of: 500.0) equals: 2.5