tests-arithmetic-API
testProductWithScaledDecimals

	self
		assert: 0 perMille * 100.0s2 equals: 0.0s2;
		assert: 100.0s2 * 0 perMille equals: 0.0s2;
		assert: 1000 perMille * 5.0s2 equals: 5.0s2;
		assert: 5.0s2 * 1000 perMille equals: 5.0s2;
		assert: (PerMille of: 500.0s2) * 5.0s2 equals: 2.5s2;
		assert: 5.0s2 * (PerMille of: 500.0s2) equals: 2.5s2