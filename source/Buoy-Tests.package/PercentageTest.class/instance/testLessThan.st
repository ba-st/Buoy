tests-magnitude-API
testLessThan

	self
		assert: Percentage zero < Percentage oneHundred;
		assert: Percentage zero < 1;
		deny: Percentage zero < Percentage zero;
		assert: -1 < Percentage zero