tests-magnitude-API
testEqualsWithScaledDecimals

	self
		assert: (PerMille ratio: 0.0s2) equals: 0.0s2;
		assert: 0.0s2 equals: (PerMille ratio: 0.0s2);
		assert: (PerMille ratio: 1.0s2) equals: 1.0s2;
		assert: 1.0s2 equals: (PerMille ratio: 1.0s2);
		assert: 4.32s2 equals: (PerMille ratio: 4.32s2)