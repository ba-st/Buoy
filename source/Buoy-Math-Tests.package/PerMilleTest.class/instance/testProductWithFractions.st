tests-arithmetic-API
testProductWithFractions

	self
		assert: 0 perMille * (1 / 2) equals: 0;
		assert: 1 / 2 * 0 perMille equals: 0;
		assert: 1000 perMille * (3 / 4) equals: 3 / 4;
		assert: 3 / 4 * 1000 perMille equals: 3 / 4;
		assert: (PerMille of: 500) * (3 / 4) equals: 3 / 8;
		assert: 3 / 4 * (PerMille of: 500) equals: 3 / 8