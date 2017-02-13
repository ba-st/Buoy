tests-printing
testStoreOn

	self
		assert: 0 perMille storeString equals: '0 perMille';
		assert: 1000 perMille storeString equals: '1000 perMille';
		assert: (PerMille of: 12) storeString equals: '12 perMille'