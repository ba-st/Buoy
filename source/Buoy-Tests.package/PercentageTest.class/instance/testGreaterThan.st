tests-magnitude-API
testGreaterThan

	self
		assert: Percentage oneHundred > Percentage zero;
		assert: 1 > Percentage zero;
		deny: Percentage zero > Percentage zero;
		assert: Percentage zero > -1