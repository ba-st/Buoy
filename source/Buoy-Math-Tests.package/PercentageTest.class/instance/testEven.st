tests-testing
testEven

	self
		assert: Percentage zero even;
		deny: Percentage oneHundred even;
		deny: (Percentage of: 14) even