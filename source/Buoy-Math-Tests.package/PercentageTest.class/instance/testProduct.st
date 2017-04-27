tests-arithmetic-API
testProduct

	self
		assert: Percentage zero * 100 equals: 0;
		assert: 100 * Percentage zero equals: 0;
		assert: Percentage oneHundred * 5 equals: 5;
		assert: 5 * Percentage oneHundred equals: 5;
		assert: (Percentage of: 50) * 5 equals: 5 / 2;
		assert: 5 * (Percentage of: 50) equals: 5 / 2