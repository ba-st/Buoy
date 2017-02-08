tests-arithmetic-API
testProductWithScaledDecimals

	self
		assert: Percentage zero * 100.0s2 equals: 0.0s2;
		assert: 100.0s2 * Percentage zero equals: 0.0s2;
		assert: Percentage oneHundred * 5.0s2 equals: 5.0s2;
		assert: 5.0s2 * Percentage oneHundred equals: 5.0s2;
		assert: (Percentage of: 50.0s2) * 5.0s2 equals: 2.5s2;
		assert: 5.0s2 * (Percentage of: 50.0s2) equals: 2.5s2