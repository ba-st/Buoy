tests-magnitude-API
testEquals

	self
		assert: 0 perMille equals: 0 perMille;
		assert: 1000 perMille equals: (PerMille ratio: 1)