tests-testing
testPositive

	self
		assert: 0 perMille positive;
		assert: 1000 perMille positive;
		deny: (PerMille of: -114) positive