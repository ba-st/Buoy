tests-magnitude-API
testBetweenAnd

	self
		assert: (Percentage oneHundred between: Percentage zero and: 101);
		assert: (Percentage oneHundred between: Percentage oneHundred and: (Percentage of: 101));
		assert: (Percentage oneHundred between: Percentage zero and: Percentage oneHundred);
		deny: (Percentage oneHundred between: 101 and: 102)