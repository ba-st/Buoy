tests-magnitude-API
testEqualsWithIntegers

	self
		assert: 0 perMille  equals: 0;
		assert: 0 equals: 0 perMille;
		assert: 1000 perMille  equals: 1;
		assert: 1 equals: 1000 perMille