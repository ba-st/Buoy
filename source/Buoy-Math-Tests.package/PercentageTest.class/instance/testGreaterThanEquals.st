tests-magnitude-API
testGreaterThanEquals

	self
		assert: Percentage oneHundred >= Percentage zero;
		assert: 1 >= Percentage zero;
		assert: Percentage zero >= Percentage zero;
		assert: 0 >= Percentage zero;
		assert: Percentage zero >= -1