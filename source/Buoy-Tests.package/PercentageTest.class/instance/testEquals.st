tests-magnitude-API
testEquals

	self
		assert: Percentage zero equals: Percentage zero;
		assert: Percentage oneHundred equals: (Percentage ratio: 1)