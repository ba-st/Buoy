tests-testing
testStrictlyPositive

	self
		deny: Percentage zero strictlyPositive;
		assert: Percentage oneHundred strictlyPositive;
		deny: (Percentage of: -114) strictlyPositive