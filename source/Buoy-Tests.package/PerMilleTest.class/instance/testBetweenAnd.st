tests-magnitude-API
testBetweenAnd

	self
		assert: (1000 perMille between: 0 perMille and: 101);
		assert: (1000 perMille between: 1000 perMille and: 1001 perMille);
		assert: (1000 perMille between: 0 perMille and: 1000 perMille);
		deny: (1000 perMille between: 1001 and: 1002)