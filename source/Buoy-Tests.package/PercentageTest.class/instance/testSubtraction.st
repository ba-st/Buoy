tests-arithmetic-API
testSubtraction

	self
		assert: Percentage zero - Percentage oneHundred equals: Percentage oneHundred negated;
		assert: (Percentage zero - Percentage oneHundred) printString equals: '-100%';
		assert: Percentage oneHundred - (Percentage of: 5) equals: (Percentage of: 95);
		assert: (Percentage oneHundred - (Percentage of: 5)) printString equals: '95%'