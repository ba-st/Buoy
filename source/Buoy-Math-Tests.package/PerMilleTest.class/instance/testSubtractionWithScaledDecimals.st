tests-arithmetic-API
testSubtractionWithScaledDecimals

	self
		assert: 0 perMille - 100.0s2 equals: -100.0s2;
		assert: 100.0s2 - 0 perMille equals: 100.0s2;
		assert: 1000 perMille - 5.0s2 equals: -4.0s2;
		assert: 5.0s2 - 1000 perMille equals: 4.0s2;
		assert: (PerMille of: 500) - 5.0s2 equals: -4.5s2;
		assert: 5.0s2 - (PerMille of: 500) equals: 4.5s2