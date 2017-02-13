tests-magnitude-API
testLessThanEquals

	self
		assert: 0 perMille <= 1000 perMille;
		assert: 0 perMille <= 1;
		assert: 0 perMille <= 0 perMille;
		assert: -1 <= 0 perMille