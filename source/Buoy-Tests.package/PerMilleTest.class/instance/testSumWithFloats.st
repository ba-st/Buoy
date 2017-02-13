tests-arithmetic-API
testSumWithFloats

	self
		assert: 0 perMille + 100.0 equals: 100.0;
		assert: 100.0 + 0 perMille equals: 100.0;
		assert: 1000 perMille + 5.0 equals: 6.0;
		assert: 5.0 + 1000 perMille equals: 6.0;
		assert: (PerMille of: 500) + 5.0 equals: 5.5;
		assert: 5.0 + (PerMille of: 500) equals: 5.5