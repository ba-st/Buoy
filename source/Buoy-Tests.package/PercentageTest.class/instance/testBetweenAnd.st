tests-magnitude-API
testBetweenAnd

	self
		assert: (Percentage oneHundred between: Percentage zero and: 101 percent);
		assert: (Percentage oneHundred between: Percentage oneHundred and: (Percentage of: 101));
		assert: (Percentage oneHundred between: Percentage zero and: Percentage oneHundred);
		deny: (Percentage oneHundred between: 1.1 and: 1.2)