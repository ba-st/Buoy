tests-arithmetic-API
testSumWithIntegers

	self
		assert: Percentage zero + 100 equals: 100;
		assert: 100 + Percentage zero equals: 100;
		assert: Percentage oneHundred + 5 equals: 6;
		assert: 5 + Percentage oneHundred equals: 6;
		assert: (Percentage of: 50) + 5 equals: 11 / 2;
		assert: 5 + (Percentage of: 50) equals: 11 / 2