tests-magnitude-API
testEqualsWithScaledDecimals

	self
		assert: (Percentage ratio: 0.0s2) equals: 0.0s2;
		assert: 0.0s2 equals: (Percentage ratio: 0.0s2);
		assert: (Percentage ratio: 1.0s2) equals: 1.0s2;
		assert: 1.0s2 equals: (Percentage ratio: 1.0s2);
		assert: 4.32s2 equals: (Percentage ratio: 4.32s2)