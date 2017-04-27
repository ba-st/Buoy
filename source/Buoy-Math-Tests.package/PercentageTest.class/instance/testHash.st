tests-magnitude-API
testHash

	self
		assert: Percentage zero hash equals: Percentage zero hash;
		assert: Percentage oneHundred hash equals: (Percentage ratio: 1) hash;
		assert: (Percentage ratio: 0.0s2) hash equals: 0.0s2 hash;
		assert: Percentage zero hash equals: 0 hash;
		assert: (Percentage ratio: 3 / 2) hash equals: (3 / 2) hash;
		assert: 1.123 hash equals: (Percentage ratio: 1.123) hash