tests-magnitude-API
testNotEquals

	self
		assert: 0 perMille ~= 1 perMille;
		assert: 1 perMille ~= 0 perMille;
		assert: 0 perMille ~= 1