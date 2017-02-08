tests-arithmetic-API
testSumWithFractions

	self
		assert: Percentage zero + (1/2) equals: 1/2;
		assert: 1/2 + Percentage zero equals: 1/2;
		assert: Percentage oneHundred + (1/2) equals: 3/2;
		assert: 1/2 + Percentage oneHundred equals: 3/2;
		assert: (Percentage of: 50) + (1/2) equals: 1;
		assert: 1/2 + (Percentage of: 50) equals: 1