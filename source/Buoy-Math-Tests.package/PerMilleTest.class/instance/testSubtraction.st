tests-arithmetic-API
testSubtraction

	self
		assert: 0 perMille - 1000 perMille equals: -1000 perMille;
		assert: (0 perMille - 1000 perMille) printString equals: '-1000‰';
		assert: 1000 perMille - (PerMille of: 5) equals: 995 perMille;
		assert: (1000 perMille - (PerMille of: 5)) printString equals: '995‰'