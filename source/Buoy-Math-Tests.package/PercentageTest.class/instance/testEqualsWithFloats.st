tests-magnitude-API
testEqualsWithFloats

	self
		assert: (Percentage ratio: 0.0) equals: 0.0;
		assert: 0.0 equals: (Percentage ratio: 0.0);
		assert: (Percentage ratio: 1.0) equals: 1.0;
		assert: 1.0 equals: (Percentage ratio: 1.0)