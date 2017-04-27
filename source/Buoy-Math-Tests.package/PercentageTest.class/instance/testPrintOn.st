tests-printing
testPrintOn

	self
		assert: Percentage zero printString equals: '0%';
		assert: Percentage oneHundred printString equals: '100%';
		assert: (Percentage of: 15) printString equals: '15%';
		assert: (Percentage ratio: 3/2) printString equals: '150%'