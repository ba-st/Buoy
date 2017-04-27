tests-magnitude-API
testHash

	self
		assert: 0 perMille hash equals: 0 perMille  hash;
		assert: 1000 perMille hash equals: (PerMille  ratio: 1) hash;
		assert: (PerMille ratio: 0.0s2) hash equals: 0.0s2 hash;
		assert: 0 perMille hash equals: 0 hash;
		assert: (PerMille ratio: 3 / 2) hash equals: (3 / 2) hash;
		assert: 1.123 hash equals: (PerMille ratio: 1.123) hash