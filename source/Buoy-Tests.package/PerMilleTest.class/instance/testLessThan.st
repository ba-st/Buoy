tests-magnitude-API
testLessThan

	self
		assert: 0 perMille < 1000 perMille;
		assert: 0 perMille < 1;
		deny: 0 perMille < 0 perMille;
		assert: -1 < 0 perMille