tests-magnitude-API
testEqualsWithFloats

	self
		assert: 0.0 perMille equals: 0.0;
		assert: 0.0 equals: 0.0 perMille;
		assert: (PerMille ratio: 1.0) equals: 1.0;
		assert: 1.0 equals: (PerMille ratio: 1.0)