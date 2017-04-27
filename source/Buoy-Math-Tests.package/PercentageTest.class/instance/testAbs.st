tests-arithmetic-API
testAbs

	self
		assert: Percentage zero abs equals: Percentage zero;
		assert: Percentage oneHundred abs equals: Percentage oneHundred;
		assert: (Percentage of: -15) abs equals: (Percentage of: 15);
		assert: (Percentage of: -15) abs printString equals: '15%'