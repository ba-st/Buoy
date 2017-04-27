tests-arithmetic-API
testSubtractionWithFractions

	self
		assert: 0 perMille - (1 / 2) equals: -1 / 2;
		assert: (1 / 2) - 0 perMille equals: 1 / 2;
		assert: 1000 perMille - (1 / 2) equals: 1 / 2;
		assert: (1 / 2) - 1000 perMille equals: -1 / 2;
		assert: (PerMille of: 500) - (1 / 2) equals: 0;
		assert: (1 / 2) - (PerMille of: 500) equals: 0