tests-arithmetic-API
testProductWithFractions

	self
		assert: Percentage zero * (1 / 2) equals: 0;
		assert: 1 / 2 * Percentage zero equals: 0;
		assert: Percentage oneHundred * (3 / 4) equals: 3 / 4;
		assert: 3 / 4 * Percentage oneHundred equals: 3 / 4;
		assert: (Percentage of: 50) * (3 / 4) equals: 3 / 8;
		assert: 3 / 4 * (Percentage of: 50) equals: 3 / 8