tests-arithmetic-API
testAbs

	self
		assert: 0 perMille abs equals: 0 perMille;
		assert: 1000 perMille abs equals: 1000 perMille;
		assert: -15 perMille abs equals: 15 perMille;
		assert: -15 perMille abs printString equals: '15‰'