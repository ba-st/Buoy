tests-arithmetic-API
testSubtractionWithFractions

	self
		assert: Percentage zero - (1/2) equals: -1/2;
		assert: 1/2 - Percentage zero equals: 1/2;
		assert: Percentage oneHundred - (1/2) equals: 1/2;
		assert: 1/2 - Percentage oneHundred equals: -1/2;
		assert: (Percentage of: 50) - (1/2) equals: 0;
		assert: 1/2 - (Percentage of: 50) equals: 0