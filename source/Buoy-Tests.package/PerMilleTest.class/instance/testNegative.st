tests-testing
testNegative

	self
		deny: 0 perMille   negative;
		deny: 1 perMille negative;
		assert: (PerMille of: -114) negative