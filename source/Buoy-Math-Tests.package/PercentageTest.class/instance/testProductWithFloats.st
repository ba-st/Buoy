tests-arithmetic-API
testProductWithFloats

	self
		assert: Percentage zero * 100.0 equals: 0.0;
		assert: 100.0 * Percentage zero equals: 0.0;
		assert: Percentage oneHundred * 5.0 equals: 5.0;
		assert: 5.0 * Percentage oneHundred equals: 5.0;
		assert: (Percentage of: 50.0) * 5.0 equals: 2.5;
		assert: 5.0 * (Percentage of: 50.0) equals: 2.5