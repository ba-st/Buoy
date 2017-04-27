tests-testing
testNegative

	self
		deny: Percentage zero negative;
		deny: Percentage oneHundred negative;
		assert: (Percentage of: -114) negative