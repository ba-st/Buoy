tests-printing
testPrintOn

	self
		assert: 0 perMille printString equals: '0‰';
		assert: 1000 perMille printString equals: '1000‰';
		assert: (PerMille of: 15) printString equals: '15‰';
		assert: (PerMille ratio: 3 / 2) printString equals: '1500‰'