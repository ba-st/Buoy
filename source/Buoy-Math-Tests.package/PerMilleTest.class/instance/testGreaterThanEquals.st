tests-magnitude-API
testGreaterThanEquals

	self
		assert: 1000 perMille >= 0 perMille;
		assert: 1 >= 0 perMille;
		assert: 0 perMille >= 0 perMille;
		assert: 0 >= 0 perMille;
		assert: 0 perMille >= -1