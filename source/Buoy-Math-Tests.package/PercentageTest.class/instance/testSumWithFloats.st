tests-arithmetic-API
testSumWithFloats

	self
		assert: Percentage zero + 100.0 equals: 100.0;
		assert: 100.0 + Percentage zero equals: 100.0;
		assert: Percentage oneHundred + 5.0 equals: 6.0;
		assert: 5.0 + Percentage oneHundred equals: 6.0;
		assert: (Percentage of: 50) + 5.0 equals: 5.5;
		assert: 5.0 + (Percentage of: 50) equals: 5.5