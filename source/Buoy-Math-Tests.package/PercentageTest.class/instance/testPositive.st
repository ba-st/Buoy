tests-testing
testPositive

	self
		assert: Percentage zero positive;
		assert: Percentage oneHundred positive;
		deny: (Percentage of: -114) positive