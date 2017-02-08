tests-magnitude-API
testEqualsWithIntegers

	self
		assert: Percentage zero equals: 0;
		assert: 0 equals: Percentage zero;
		assert: Percentage oneHundred equals: 1;
		assert: 1 equals: Percentage oneHundred