tests-arithmetic-API
testSumWithIntegers

	self
		assert: 0 perMille + 100 equals: 100;
		assert: 100 + 0 perMille equals: 100;
		assert: 1000 perMille + 5 equals: 6;
		assert: 5 + 1000 perMille equals: 6;
		assert: (PerMille of: 500) + 5 equals: 11 / 2;
		assert: 5 + (PerMille of: 500) equals: 11 / 2