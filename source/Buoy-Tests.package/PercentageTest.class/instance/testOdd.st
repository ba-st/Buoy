tests-testing
testOdd

	self
		deny: Percentage zero odd;
		assert: Percentage oneHundred odd;
		assert: (Percentage of: 14) odd