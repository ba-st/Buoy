tests-magnitude-API
testEqualsWithFractions

	self
		assert: (PerMille ratio: 3/2) equals: 3/2;
		assert: 3/2 equals: (PerMille ratio: 3/2)