tests-magnitude-API
testEqualsWithFractions

	self
		assert: (Percentage ratio: 3/2) equals: 3/2;
		assert: 3/2 equals: (Percentage ratio: 3/2)