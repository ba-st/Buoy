tests-arithmetic-API
testProduct

	self
		assert: 0 perMille * 100 equals: 0;
		assert: 100 * 0 perMille equals: 0;
		assert: 1000 perMille * 5 equals: 5;
		assert: 5 * 1000 perMille equals: 5;
		assert: (PerMille of: 500) * 5 equals: 5 / 2;
		assert: 5 * (PerMille of: 500) equals: 5 / 2