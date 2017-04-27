tests-arithmetic-API
testSubtractionWithScaledDecimals

	self
		assert: Percentage zero - 100.0s2 equals: -100.0s2;
		assert: 100.0s2 - Percentage zero equals: 100.0s2;
		assert: Percentage oneHundred - 5.0s2 equals: -4.0s2;
		assert: 5.0s2 - Percentage oneHundred equals: 4.0s2;
		assert: (Percentage of: 50) - 5.0s2 equals: -4.5s2;
		assert: 5.0s2 - (Percentage of: 50) equals: 4.5s2