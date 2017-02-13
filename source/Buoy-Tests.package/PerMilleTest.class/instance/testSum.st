tests-arithmetic-API
testSum

	self
		assert: 0 perMille + 1000 perMille equals: 1000 perMille;
		assert: (0 perMille + 1000 perMille) printString equals: '1000‰';
		assert: 1000 perMille + (PerMille of: 50) equals: (PerMille of: 1050);
		assert: (1000 perMille + (PerMille of: 50)) printString equals: '1050‰'